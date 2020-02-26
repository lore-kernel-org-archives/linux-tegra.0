From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] usb: host: xhci-tegra: Tegra186/Tegra194 LPM
Date: Wed, 26 Feb 2020 11:32:04 +0200
Message-ID: <6c93af2b-5a4d-a3ad-07f4-f5c72f569752@linux.intel.com>
References: <20200224062145.25785-1-jckuo@nvidia.com>
 <20200224125100.GA2108060@ulmo>
 <223f5f09-781a-825d-e75e-3b878acec27d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <223f5f09-781a-825d-e75e-3b878acec27d-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 26.2.2020 10.12, JC Kuo wrote:
> Hi Thierry,
> Yes, it can be verified with a LPM capable device. For example, a VIA USB 3.0
> hub is connected to Jetson-Xavier. "lsusb -v" output [1] shows the device
> supports LPM and the host has enabled U1/U2 states for the device. If host LPM
> is disabled, there will be no "U1 Enabled" and "U2 Enabled" strings in "Device
> Status" section.
> 
> To check LPM operation, disconnect all USB 3.0 devices from the hub and disable
> runtime PM for the super-speed portion of the hub, so that it won't be
> auto-suspended.
> root@tegra-ubuntu:~# echo on > /sys/bus/usb/devices/2-4/power/control
> 
> Since there is no data transaction for the hub, link will enter U2 soon. This
> can be checked by reading XHCI.PORTSC register. In below, PLS (Port Link State)
> field is U2.
> root@tegra-ubuntu:~# devmem 0x3610450
> 0x00001243

A more human friendly way to read portsc registers:

# cat /sys/kernel/debug/usb/xhci/0000\:00\:14.0/ports/port02/portsc 
Powered Connected Enabled Link:U0 PortSpeed:3 Change: Wake: 

-Mathias
