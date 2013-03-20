From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: USB-related build errors on Tegra in next-20130319
Date: Wed, 20 Mar 2013 10:51:49 -0600
Message-ID: <5149E925.7030302@wwwdotorg.org>
References: <51489251.5040504@wwwdotorg.org> <20130320122031.GI29659@arwen.pp.htv.fi> <5149E62F.9090705@wwwdotorg.org> <20130320164553.GL1567@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130320164553.GL1567-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 10:45 AM, Felipe Balbi wrote:
> Hi,
> 
> On Wed, Mar 20, 2013 at 10:39:11AM -0600, Stephen Warren wrote:
>> On 03/20/2013 06:20 AM, Felipe Balbi wrote:
...
>> The patch you gave fixes the Kconfig warnings, but not the build
>> failure.
...
>> For now, I think the correct solution is to have USB_EHCI_TEGRA
>> select USB_PHY. I validated that solves the build problem, and
>> has the bonus of not needing any changes to tegra_defconfig.
...
> Alright, do you want to send that patch ? My bad that I missed
> that build error...

Sure. Do you want to roll it into your patch and repost it, or me to
send a separate patch?

I assume you'd apply both to the same branch that contains the patches
that add the USB_PHY config option? If the arch/arm patch gets applied
to the Tegra tree instead, it'll cause breakage there since USB_PHY
won't exist yet, so USB will be disabled until merged with the USB
tree in 3.10-rc1.
