From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
Date: Sat, 4 Jul 2020 13:53:00 -0600
Message-ID: <CAPnjgZ2NxmsXUSNQtaLFxp3Qnx2O1ZqtQGQ5-9-z6vbb8ykW0g@mail.gmail.com>
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

On Fri, 3 Jul 2020 at 06:33, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Good Morning,
>
> I am attempting to expand on the work for chainloading U-Boot on the
> nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> I have so far been unsuccessful at getting any output from U-Boot
> through this method.
>
> I'm building the cardhu board with tweaks for Ouya's specifications
> similar to my work for the linux kernel.
> I build the image using mkbootimg --kernel u-boot.bin --ramdisk
> /dev/null --output u-boot-android.bin.
> I then fastboot boot u-boot-android.bin.
>
> I've tried tweaking the text base and tried both standard debug and
> low level debug.
>
> Do you think you could give me some insight into where I'm going wrong?

Is it possible that fastboot expects a relocatable image? If you set
up the debug UART very early you might be able to output a character
in start.S ?

BTW does U-Boot have support for the fastboot protocol? Perhaps you
could just use U-Boot?

Regards,
Simon
