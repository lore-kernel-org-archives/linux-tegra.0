From: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] usb: host: xhci-tegra: Tegra186/Tegra194 LPM
Date: Wed, 26 Feb 2020 16:12:05 +0800
Message-ID: <223f5f09-781a-825d-e75e-3b878acec27d@nvidia.com>
References: <20200224062145.25785-1-jckuo@nvidia.com>
 <20200224125100.GA2108060@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200224125100.GA2108060@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,
Yes, it can be verified with a LPM capable device. For example, a VIA USB 3.0
hub is connected to Jetson-Xavier. "lsusb -v" output [1] shows the device
supports LPM and the host has enabled U1/U2 states for the device. If host LPM
is disabled, there will be no "U1 Enabled" and "U2 Enabled" strings in "Device
Status" section.

To check LPM operation, disconnect all USB 3.0 devices from the hub and disable
runtime PM for the super-speed portion of the hub, so that it won't be
auto-suspended.
root@tegra-ubuntu:~# echo on > /sys/bus/usb/devices/2-4/power/control

Since there is no data transaction for the hub, link will enter U2 soon. This
can be checked by reading XHCI.PORTSC register. In below, PLS (Port Link State)
field is U2.
root@tegra-ubuntu:~# devmem 0x3610450
0x00001243

Thanks,
JC

[1] lsusb -v -d 2109:0820
Bus 002 Device 002: ID 2109:0820 VIA Labs, Inc.
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            9 Hub
  bDeviceSubClass         0 Unused
  bDeviceProtocol         3
  bMaxPacketSize0         9
  idVendor           0x2109 VIA Labs, Inc.
  idProduct          0x0820
  bcdDevice            4.e3
  iManufacturer           1 VIA Labs, Inc.
  iProduct                2 USB3.0 Hub
  iSerial                 0
  bNumConfigurations      1

...
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           42
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat           4 micro seconds
    bU2DevExitLat         231 micro seconds
  Container ID Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType      4
    bReserved               0
    ContainerID             {5cf3ee30-d507-4925-b001-802d79434c30}
Device Status:     0x000d
  Self Powered
  U1 Enabled
  U2 Enabled



On 2/24/20 8:51 PM, Thierry Reding wrote:
> On Mon, Feb 24, 2020 at 02:21:45PM +0800, JC Kuo wrote:
>> Tegra186 and Tegra194 xHC supports USB 3.0 LPM. This commit enables
>> XHCI_LPM_SUPPORT quirk for Tegra186 and Tegra194.
>>
>> Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
> 
> I see that Mathias has already queued this up, but for the record:
> 
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> JC, is there some way that we can test this? I see that there are some
> sysfs files that can control LPM enablement on a per-device basis, but
> is there some way to check that this works as expected? Or do we just
> assume everything is fine as long as all the devices continue to operate
> properly? Perhaps there are some state transition counters or something
> that would indicate that devices are properly transitioning?
> 
> Thierry
> 
