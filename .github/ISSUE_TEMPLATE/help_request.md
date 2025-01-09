---
name: Help request
about: I need help
title: "[Help request]: "
labels: ["help-request"]
assignees: ''

---

**Describe your problem**
A clear and concise description of what the problem is, starting with which section are you currently in.

Please fill the following

**System information**

- **Operating System**: 
- **Kernel Version**: 
- **Manufacturer**: 
- **Product Name**: 
- **Type of device (laptop, desktop...)**: 

Fill with output of each command

**`pactl info`**

```yaml
# paste command output here

```

**Codecs `cat /proc/asound/card*/codec#* | grep -E 'Codec|Vendor Id|Subsystem Id|Address'`**

```yaml
# paste command output here
```

**Cards `pactl list cards`**

```yaml
# paste command output here
```

**Sinks before and after: `pactl list sinks`**

When you started

```yaml
# paste command output here
```

Now

```yaml
# paste command output here
```

**Aplay before and after `aplay -l`**

When you started

```yaml
# paste command output here
```

Now

```yaml
# paste command output here
```
