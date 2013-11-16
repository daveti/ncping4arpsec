ncping4arpsec

no caching ping for arpsec

ncping will do the normal ping except clearing the ARP cache each time before ping. 
By doing this, ncping could help evaluate the performance/overhead of ARP implementation.
A timer (5 secs) is introduced in ncping4arpsec before each ICMP msg is sent out. 
By doing this, ARP cache update race condition could be avoid between arpsec and ncping.

NOTE: ncping is based on the original ping source by 'apt-get install iputils'. 

Nov 16, 2013

root@davejingtian.org

http://davejingtian.org
