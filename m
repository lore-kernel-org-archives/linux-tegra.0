From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
Date: Mon, 6 Jul 2020 15:48:12 -0400
Message-ID: <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dda406a7-8199-f2ad-b64a-35791aa1033b-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 6, 2020 at 1:04 PM Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>
> On 7/3/20 6:32 AM, Peter Geis wrote:
> > Good Morning,
> >
> > I am attempting to expand on the work for chainloading U-Boot on the
> > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > I have so far been unsuccessful at getting any output from U-Boot
> > through this method.
>
> I assume that fastboot executes the loaded code on the main CPU not on
> the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start running on
> the AVP though; you would have to disable SPL to make this all work, and
> perhaps fix U-Boot to work without SPL present. I'm not sure what, if
> any, changes would be required to support that.
>
> For background, see:
> https://http.download.nvidia.com/tegra-public-appnotes/index.html

Apologies for the resend, I realized I didn't reply to the list.

I admit I'm still extremely new to U-Boot, but this is the way I
understand the boot flow.
ROM does extremely low level init, then loads U-boot SPL.
U-Boot SPL does basic init, ram, cpu and required peripherals, then
loads U-Boot.bin.
U-Boot.bin is U-Boot proper, with the full interface.

By loading U-Boot.bin as the nyan instructions indicated, I'm
bypassing the SPL code as if it was already complete.
The issue I have is I'm not sure what modifications were done to the
T124 code to allow nyan to do this.
I've compared the nyan configs to the cardhu configs and I don't see
anything that sticks out to me.
I've also dug through the nyan git log and I don't see anything that
was specifically changed to allow chainloading on T124.

I also am unsure of where fastboot is loading the kernel in order to
set the text base correctly.
