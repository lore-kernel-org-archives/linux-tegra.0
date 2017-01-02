From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: Ethernet on Tegra TX
Date: Mon, 2 Jan 2017 18:48:08 +0200
Message-ID: <8056dcbc-193c-3516-a874-c914656ca371@kapsi.fi>
References: <CAGWmfYqgarb5cC08wtkWiWjWMR3tXm39z7bKH8+LZN+sThD8Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGWmfYqgarb5cC08wtkWiWjWMR3tXm39z7bKH8+LZN+sThD8Qg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Claudio Scordino <claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The reason would likely be that the onboard Ethernet is a USB RTL8152 
which does not seem to be compiled in. Additionally you may need to 
ensure the XUSB controller firmware (firmware/nvidia/tegra210/xusb.bin) 
is available during boot, either on an initrd or built-in to the kernel. 
I agree that this should be documented.

On 01/02/2017 05:50 PM, Claudio Scordino wrote:
> Dear guys,
>
> just to let you know that trying the instructions at
> http://elinux.org/Jetson/TX1_Upstream_Kernel with a TX1 board and a
> 4.9 kernel, the Ethernet interface doesn't start.
>
> The console complains saying "RTNETLink Network unreachable" and
> ifconfig only shows the loopback interface.
>
> Attached the .config file.
>
> Once found the reason (I still have to investigate but you may already
> know), you may want to update the page with further instructions.
>
> Best regards and wishes for 2017.
>
>                 Claudio
>

Happy new year,
Mikko.
