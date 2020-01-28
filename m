From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v1 0/5] Add Tegra driver for video capture
Date: Tue, 28 Jan 2020 10:23:16 -0800
Message-ID: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This series adds Tegra210 VI and CSI driver for built-in test pattern
generator (TPG) capture.

Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
CSI port is one-to-one mapped to VI channel for video capture.

This series has TPG support only where it creates hard media links
between CSI subdevice and VI video device without device graphs.

v4l2-compliance results are available below the patch diff.

[v0]:	Includes,
	- Adds CSI TPG clock to Tegra210 clock driver
	- Host1x video driver with VI and CSI clients.
	- Support for Tegra210 only.
	- VI CSI TPG support with hard media links in driver.
	- Video formats supported by Tegra210 VI
	- CSI TPG supported video formats


Sowjanya Komatineni (5):
  dt-bindings: clock: tegra: Add clk id for CSI TPG clock
  clk: tegra: Add Tegra210 CSI TPG clock gate
  dt-binding: tegra: Add VI and CSI bindings
  media: tegra: Add Tegra Video input driver for Tegra210
  arm64: tegra: Add Tegra VI CSI suppport in device tree

 .../display/tegra/nvidia,tegra20-host1x.txt        |  10 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   8 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  31 +-
 drivers/clk/tegra/clk-tegra210.c                   |   7 +
 drivers/staging/media/Kconfig                      |   2 +
 drivers/staging/media/Makefile                     |   1 +
 drivers/staging/media/tegra/Kconfig                |  12 +
 drivers/staging/media/tegra/Makefile               |  11 +
 drivers/staging/media/tegra/TODO                   |  10 +
 drivers/staging/media/tegra/csi.h                  | 111 ++++
 drivers/staging/media/tegra/csi2_fops.c            | 335 +++++++++++
 drivers/staging/media/tegra/csi2_fops.h            |  15 +
 drivers/staging/media/tegra/host1x-video.c         | 120 ++++
 drivers/staging/media/tegra/host1x-video.h         |  33 ++
 drivers/staging/media/tegra/mc_common.h            | 131 +++++
 drivers/staging/media/tegra/tegra-channel.c        | 628 +++++++++++++++++++++
 drivers/staging/media/tegra/tegra-core.c           | 111 ++++
 drivers/staging/media/tegra/tegra-core.h           | 125 ++++
 drivers/staging/media/tegra/tegra-csi.c            | 380 +++++++++++++
 drivers/staging/media/tegra/tegra-vi.c             | 351 ++++++++++++
 drivers/staging/media/tegra/tegra-vi.h             | 101 ++++
 drivers/staging/media/tegra/vi2_fops.c             | 364 ++++++++++++
 drivers/staging/media/tegra/vi2_fops.h             |  15 +
 drivers/staging/media/tegra/vi2_formats.h          | 119 ++++
 drivers/staging/media/tegra/vi2_registers.h        | 194 +++++++
 include/dt-bindings/clock/tegra210-car.h           |   2 +-
 26 files changed, 3224 insertions(+), 3 deletions(-)
 create mode 100644 drivers/staging/media/tegra/Kconfig
 create mode 100644 drivers/staging/media/tegra/Makefile
 create mode 100644 drivers/staging/media/tegra/TODO
 create mode 100644 drivers/staging/media/tegra/csi.h
 create mode 100644 drivers/staging/media/tegra/csi2_fops.c
 create mode 100644 drivers/staging/media/tegra/csi2_fops.h
 create mode 100644 drivers/staging/media/tegra/host1x-video.c
 create mode 100644 drivers/staging/media/tegra/host1x-video.h
 create mode 100644 drivers/staging/media/tegra/mc_common.h
 create mode 100644 drivers/staging/media/tegra/tegra-channel.c
 create mode 100644 drivers/staging/media/tegra/tegra-core.c
 create mode 100644 drivers/staging/media/tegra/tegra-core.h
 create mode 100644 drivers/staging/media/tegra/tegra-csi.c
 create mode 100644 drivers/staging/media/tegra/tegra-vi.c
 create mode 100644 drivers/staging/media/tegra/tegra-vi.h
 create mode 100644 drivers/staging/media/tegra/vi2_fops.c
 create mode 100644 drivers/staging/media/tegra/vi2_fops.h
 create mode 100644 drivers/staging/media/tegra/vi2_formats.h
 create mode 100644 drivers/staging/media/tegra/vi2_registers.h


v4l2-compliance SHA: e7402fb758fd106955c3b7d5a5e961d1cb606f4a, 32 bits, 32-bit time_t

Compliance test for tegra-video device /dev/video0:

Driver Info:
        Driver name      : tegra-video
        Card type        : 54080000.vi-output-0
        Bus info         : platform:54080000.vi:0
        Driver version   : 5.5.0
        Capabilities     : 0x85200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x05200001
                Video Capture
                Read/Write
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : host1x_video
        Model            : NVIDIA Tegra Video Input Device
        Serial           :
        Bus info         :
        Media version    : 5.5.0
        Hardware revision: 0x00000003 (3)
        Driver version   : 5.5.0
Interface Info:
        ID               : 0x03000003
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : 54080000.vi-output-0
        Function         : V4L2 I/O
        Pad 0x01000002   : 0: Sink
          Link 0x0200001b: from remote pad 0x100001a of entity 'tpg-0': Data, Enabled

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK
        test blocking wait: OK
        test MMAP (no poll): OK
        test MMAP (select): OK
        test MMAP (epoll): OK
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for tegra-video device /dev/video0: 53, Succeeded: 53, Failed: 0, Warnings: 0

-- 
2.7.4
