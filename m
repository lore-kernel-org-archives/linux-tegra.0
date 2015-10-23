From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra-xusb: Correct lane mux options
Date: Fri, 23 Oct 2015 12:56:51 -0600
Message-ID: <562A82F3.3060309@wwwdotorg.org>
References: <1444987441-25176-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444987441-25176-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/16/2015 03:24 AM, Jon Hunter wrote:
> The description of the XUSB_PADCTL_USB3_PAD_MUX_0 register in the Tegra124
> documentation implies that all functions (pcie, usb3 and sata) can be
> muxed onto to all lanes (pcie lanes 0-4 and sata lane 0). However, it has
> been confirmed that this is not the case and the mux'ing options much more
> limited. Unfortunately, the public documentation has not been updated to
> reflect this and so detail the actual mux'ing options here by function:
>
> Function:		Lanes:
> pcie1 x2:		pcie3, pcie4
> pcie1 x4:		pcie1, pcie2, pcie3, pcie4
> pcie2 x1 (option1):	pcie0
> pcie2 x1 (option2):	pcie2
> usb3 port 0:		pcie0
> usb3 port 1 (option 1):	pcie1
> usb3 port 1 (option 2):	sata0
> sata:			sata0

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I didn't check the actual lists of values, but it sounds about right 
from memory.
