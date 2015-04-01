From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: "ARM: multi_v7_defconfig: Enable shmobile platforms" breaks Tegra20
 multi_v7_defconfig boot
Date: Wed, 01 Apr 2015 11:14:16 -0600
Message-ID: <551C2768.6060209@wwwdotorg.org>
References: <alpine.DEB.2.02.1503251740130.13341@utopia.booyaka.com> <CANMBJr7ibVCxQRUG47OT0meNntMjEoVqL7kiEK9DtCfp5NXPgg@mail.gmail.com> <alpine.DEB.2.02.1503252157240.7173@utopia.booyaka.com> <55137098.4030903@wwwdotorg.org> <alpine.DEB.2.02.1503261826210.18294@utopia.booyaka.com> <5514569E.2030406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5514569E.2030406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/26/2015 12:57 PM, Stephen Warren wrote:
> On 03/26/2015 12:35 PM, Paul Walmsley wrote:
>> On Wed, 25 Mar 2015, Stephen Warren wrote:
>>
>>> On 03/25/2015 04:00 PM, Paul Walmsley wrote:
>>>> On Wed, 25 Mar 2015, Tyler Baker wrote:
>>>>> On 25 March 2015 at 11:03, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>> Looks like commit 4a3a6f86693922b29cf829c63f652b057f14619e ("ARM:
>>>>>> multi_v7_defconfig: Enable shmobile platforms") breaks Tegra20
>>>>>> multi_v7_defconfig boot.
...
>>>>> Can you try to shift your kernel load address around a bit? From
>>>>> experience with the boards from kernelci.org we find that as the multi
>>>>> v7 kernel size increases they can clobber memory when they get
>>>>> decompressed.
>>>>
>>>> Thanks, that was it:
>>>>
>>>> http://nvt.pwsan.com/pub/pwalmsley-tester/testlogs/test_20150325144058_6af714b069dc278d5d8e1b7afc13568f71d9aba8/20150325144058/boot/tegra20-trimslice/tegra20-trimslice/multi_v7_defconfig_log.txt
...
>>> Interesting. Do the values in U-Boot's default environment work
>>> correctly
>>
>> No idea, I haven't tried.  (The load addresses I used are observable in
>> the boot logs above.)
>
> Sure. I was hoping you'd try it out since you already had the setup to
> repro the issue.
>
> It'd be good if your test-bed used the built-in U-Boot variables too, so
> we're testing them.

I've reproduced the original problem, and then validated that using the 
addresses from U-Boot's default environment (at least with a ToT U-Boot 
that I just built) does indeed solve it.

I'd like to re-iterate that the test bed should be using the values from 
U-Boot's environment rather than making up its own. That way:

* The value the test bed uses for the kernel load address likely 
overlaps where the kernel decompressor writes to for even slightly large 
kernels. This means the decompressor must move itself before 
decompressing. IIUC, there's zero guarantee that moving the decompressor 
won't overwrite the DTB, since IIUC the decompressor uses zero knowledge 
of the DTB location. In other words, if the compressed kernel is loaded 
somewhere that's likely to require it to move itself, there's a real 
risk of the exact same problem cropping up again in the future if the 
kernel happens to overwrite the DTB during relocation.

* The values are part of every Tegra U-Boot port (and hopefully for 
other SoCs too given any distro using boot.scr with 
config_distro_bootcmd.h will expect the variables to exist), so for 
future (Tegra) chips you won't have to adjust the test bed if RAM layout 
changes.

* Those values get testing, so we'll find out if the ever don't work. We 
get more test coverage.
