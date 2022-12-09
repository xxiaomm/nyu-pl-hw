
package sem is
  type semaphore is private;
  procedure P(s: semaphore);
  procedure V(s: semaphore);
  function newsem return semaphore;
private
  task type semtask is entry P; entry V; end semtask;
  type semaphore is access semtask;
end sem;