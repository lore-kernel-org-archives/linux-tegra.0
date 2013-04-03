From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 0/7] USB: PHY: Tegra: registering TEGRA USB PHY as platform
 driver
Date: Wed, 03 Apr 2013 13:47:06 -0600
Message-ID: <515C873A.2060504@wwwdotorg.org>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <5148C1DC.1020903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5148C1DC.1020903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/19/2013 01:51 PM, Stephen Warren wrote:
> On 03/18/2013 06:29 AM, Venu Byravarasu wrote:
>> As part of this series, apart from patch containing changes to register TEGRA
>> USB PHY driver as platform driver, prepared below patches:
>> 1. Re-arranging & adding new DT properties.
>> 2. Getting various params from DT properties added.
>> 3. code clean up.
> 
> Venu, I'm curious whether these patches were tested at all. I have found
> at least two significant problems with trivial testing:
...
> "reboot" or "shutdown -h now" both cause the following crash
...
> The first time enumeration USB devices is attempted on a port fails.

For the record, V2 of this series fixes both of these problems.
