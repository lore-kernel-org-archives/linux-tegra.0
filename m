From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
Date: Mon, 6 Jul 2020 07:52:00 -0400
Message-ID: <CAMdYzYrEZfSD4m1iJY0duTp37WUCW9kbbAt3mM8HQSuWGBh91w@mail.gmail.com>
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <CAPnjgZ2NxmsXUSNQtaLFxp3Qnx2O1ZqtQGQ5-9-z6vbb8ykW0g@mail.gmail.com>
 <CAMdYzYraKVxsE0NLvqRXXfP=oxw+fGZrrJC2aFQ4hp4hfAkrqQ@mail.gmail.com> <CAPnjgZ3S+sic-FcHU=1jW-9A=W-+HjjJ_UF50j9khvm5CUxGRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ3S+sic-FcHU=1jW-9A=W-+HjjJ_UF50j9khvm5CUxGRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jul 5, 2020 at 11:35 AM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> Hi Peter,
>
> On Sun, 5 Jul 2020 at 05:33, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > On Sat, Jul 4, 2020 at 3:53 PM Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > >
> > > Hi Peter,
> > >
> > > On Fri, 3 Jul 2020 at 06:33, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > >
> > > > Good Morning,
> > > >
> > > > I am attempting to expand on the work for chainloading U-Boot on the
> > > > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > > > I have so far been unsuccessful at getting any output from U-Boot
> > > > through this method.
> > > >
> > > > I'm building the cardhu board with tweaks for Ouya's specifications
> > > > similar to my work for the linux kernel.
> > > > I build the image using mkbootimg --kernel u-boot.bin --ramdisk
> > > > /dev/null --output u-boot-android.bin.
> > > > I then fastboot boot u-boot-android.bin.
> > > >
> > > > I've tried tweaking the text base and tried both standard debug and
> > > > low level debug.
> > > >
> > > > Do you think you could give me some insight into where I'm going wrong?
> > >
> > > Is it possible that fastboot expects a relocatable image? If you set
> > > up the debug UART very early you might be able to output a character
> > > in start.S ?
> >
> > Yes, fastboot expects a relocatable image.
> > As I understand it though, if I get the text base correct, U-boot will
> > not need to relocate.
> >
> > The debug UART is already set up when it fastboot jumps to the loaded kernel,
> > So I should be able to dump data to the expected raw address and it
> > will show up?
>
> Yes, so long as you know the address. Is the MMU turned off? Cache?

It is unknown what state either of these are in, since I am unfamiliar
at all with how fastboot functions with these.
In U-boot yes the MMU was enabled as well as both I and D cache.

>
> >
> > >
> > > BTW does U-Boot have support for the fastboot protocol? Perhaps you
> > > could just use U-Boot?
> >
> > The Ouya is locked with a signed boot loader, like most consumer
> > android devices.
> > Unlike most other devices, it does not have a hardware method for
> > entering the bootloader in case of a brick.
> > We are currently using a hacked kernel that stores another kernel in
> > "safe" ram via kexec and hard resets the board, but a proper
> > bootloader would be much more preferable.
>
> OK. Maybe there is someone on this list with a bit more Android
> booting experienec?
>
> >
> > I found one example of where fastboot chainloaded u-boot successfully
> > on the galaxy nexus, from 2013.
> > https://forum.xda-developers.com/galaxy-nexus/bootloader-boot-multi-boot-support-t2201146
>
> OK, I'm sure it is possible. Do you have the source code for the
> fastboot code that boots U-Boot?

No, we have the reference code here:
https://android.googlesource.com/platform/bootable/bootloader/legacy/+/b1fde5cd7d5158b8e6876139ca76a341d0e49708/usbloader/usbloader.c

Unfortunately the behavior observed in the Ouya shows it has been
heavily modified from this baseline.

I've reached out to the dev who performed the work on u-boot for
insight as well.

>
> Regards,
> Simon
