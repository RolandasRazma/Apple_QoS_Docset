cheatsheet do
  title 'Apple QoS'               # Will be displayed by Dash in the docset list
  docset_file_name 'Apple_QoS'    # Used for the filename of the docset
  keyword 'QoS'             # Used as the initial search keyword (listed in Preferences > Docsets)
  source_url 'https://github.com/RolandasRazma/Apple_QoS_Docset'
  
  style '
  td.description .name {
    text-align:right;
    white-space:nowrap;
  }
  section.category h2 {
    text-align:left;
    padding-left: 10px;
  }
  '
  
  # Optional, can contain Markdown or HTML
  introduction <<-'END'
  A <i>quality of service (QoS) class</i> allows you to categorize work to be performed by <a href="https://developer.apple.com/documentation/foundation/operation">NSOperation</a>, <a href="apple:https://developer.apple.com/documentation/foundation/operationqueue">NSOperationQueue</a>, <a href="apple:https://developer.apple.com/documentation/foundation/thread">NSThread</a> objects, dispatch queues, and pthreads (POSIX threads). By assigning a QoS to work, you indicate its importance, and the system prioritizes it and schedules it accordingly. For example, the system performs work initiated by a user sooner than background work that can be deferred until a more optimal time. In some cases, system resources may be reallocated away from the lower priority work and given to the higher priority work.
  
  Because higher priority work is performed more quickly and with more resources than lower priority work, it typically requires more energy than lower priority work. Accurately specifying appropriate QoS classes for the work your app performs ensures that your app is responsive as well as energy efficient.
  
  The system uses QoS information to adjust priorities such as scheduling, CPU and I/O throughput, and timer latency. As a result, the work performed maintains a balance between performance and energy efficiency.

  When you assign a QoS to a task, consider how it affects the user and how it affects other work.
  END
  
  # A cheat sheet must consist of categories
  category do
    id 'Primary QoS classes (shown in order of priority)'  # Must be unique and is used as title of the category
    
    entry do
      name 'User-interactive'
      td_notes <<-'END'
      Work that is interacting with the user, such as operating on the main thread, refreshing the user interface, or performing animations. If the work doesn’t happen quickly, the user interface may appear frozen. Focuses on responsiveness and performance.
      
      ```
      Work is virtually instantaneous.
      ```
      
      Global queue: **Main thread**
      END
    end
    
    entry do
      name 'User-initiated'
      td_notes <<-'END'
      Work that the user has initiated and requires immediate results, such as opening a saved document or performing an action when the user clicks something in the user interface. The work is required in order to continue user interaction. Focuses on responsiveness and performance.
      
      ```
      Work is nearly instantaneous, such as a few seconds or less.
      ```
      
      Global queue: **High**
      END
    end
    
    entry do
      name 'Utility'
      td_notes <<-'END'
      Work that may take some time to complete and doesn’t require an immediate result, such as downloading or importing data. Utility tasks typically have a progress bar that is visible to the user. Focuses on providing a balance between responsiveness, performance, and energy efficiency.
      
      ```
      Work takes a few seconds to a few minutes.
      ```
      
      Global queue: **Low**
      END
    end
    
    entry do
      name 'Background'
      td_notes <<-'END'
      Work that operates in the background and isn’t visible to the user, such as indexing, synchronizing, and backups. Focuses on energy efficiency.      
      
      ```
      Work takes significant time, such as minutes or hours.
      ```
  
      Global queue: **Background**
      END
    end
  end
  
  category do
    id 'Special QoS classes'
    
    entry do
      name 'Default'
      td_notes <<-'END'
      The priority level of this QoS falls between user-initiated and utility. This QoS is not intended to be used by developers to classify work. Work that has no QoS information assigned is treated as default, and the GCD global queue runs at this level.
      
      ```
      Work takes significant time, such as minutes or hours.
      ```
      
      Global queue: **Default**
      END
    end

    entry do
      name 'Unspecified'
      td_notes <<-'END'
      This represents the absence of QoS information and cues the system that an environmental QoS should be inferred. Threads can have an unspecified QoS if they use legacy APIs that may opt the thread out of QoS.
      END
    end
  end
  
  notes <<-'END'
  Optimally, run your app at a QoS level of utility or lower at least 90% of the time when user activity is not occurring.
  
  On iPhones, discretionary and background operations, including networking, are paused when Low Power Mode is enabled. <a href="https://developer.apple.com/library/archive/documentation/Performance/Conceptual/EnergyGuide-iOS/LowPowerMode.html">See React to Low Power Mode on iPhones</a>.'
  END
end