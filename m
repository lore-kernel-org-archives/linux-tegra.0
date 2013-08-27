From: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
Subject: Fwd: [PATCH 1/1] ARM: tegra: Add basic support for carma devkit
Date: Tue, 27 Aug 2013 11:19:33 +0200
Message-ID: <CAGjquTTKrcoabO01BeUG2hFgjPGDZO5w9A3p12iO5gPCnmfi8g@mail.gmail.com>
References: <1371994685-4997-1-git-send-email-chris.desjardins@amscins.com>
	<20130827075654.GG8686@ulmo>
	<CAGjquTQe0_+oEtyuF0Q0T8rZnQmz1h45T18zePe+BHVTjVQW_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGjquTQe0_+oEtyuF0Q0T8rZnQmz1h45T18zePe+BHVTjVQW_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thierry, I have looked at the comments, and I have also talked to
SECO, and they aren't willing to give me the docs necessary to really
do the job correctly (even if they did give me the docs, I am not 100%
sure I would be able to do it correctly without a direct line to their
hardware engineers), they also are unwilling to do it themselves. They
did say that they will give me feedback on a dts file, but the
feedback I got from them on the original one was little more than:
this doesn't appear to be correct. To be honest, we have decided to go
with another platform with better support in the mainline kernel (4th
gen x86, because it is powerful, low power, and well supported), and
as a result my seco board is collecting dust.

For reference here is the full "technical" feedback I got from seco:

we noticed some inconsistencies on dts file you provided: with respect
to pcie-controller, ldo2 usage is not correct and PCIe lanes
declaration doesn't look coeherent with actual hardware.

Not really enough for me to make changes with confidence... I think I
have already mentioned this, but just to be sure, comparing and
contrasting the regulator/pci settings from kernel they provide
(pre-device tree) and the mainline is like comparing apples and
oranges. Most of the names have changed, and even in the few cases
where names seem to correlate it would still take me a huge amount of
time to really figure out what I am looking at in their
source/sysfs/etc and translate it to .dts from with confidence... and
I really have no idea how I would verify it (other than looking at
sysfs or something, but to me, looking at what sysfs says about
regulator configuration and verifying that a regulator is configured
correctly are two different things).

Thanks for following up on this, sorry I won't be able to help, feel
free to take my .dts file and run with it if you want, or pressure
seco into updating it correctly if you can.

Thanks again,
    Chris D.




On 27 August 2013 09:56, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Sun, Jun 23, 2013 at 03:38:05PM +0200, Chris Desjardins wrote:
> >
> > Signed-off-by: Chris Desjardins <chris.desjardins-8HJrC8Or5ylBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/tegra30-carma.dts |  461 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 461 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/tegra30-carma.dts
>
> Hi Chris,
>
> The new PCIe driver is going to be merged in 3.12, so it would be nice
> to see this patch merged as well as given that it is one of the few
> users of PCIe.
>
> Have you had a chance to look at the comments you received?
>
> Thierry
