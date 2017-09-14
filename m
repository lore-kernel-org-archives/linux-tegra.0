From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Compiling Mainline Kernel v4.4.70 Stable to ChormeBook Nvidia
 Tegra TK1 (Ubuntu-Xenial) -Uboot Not Booting (BlackScreen)
Date: Thu, 14 Sep 2017 10:01:12 +0100
Message-ID: <ed1e0d59-b6e2-ed3e-d85e-8aa47b60dee8@nvidia.com>
References: <BY2PR19MB0295B5ACDD8A028CB9369007D66E0@BY2PR19MB0295.namprd19.prod.outlook.com>
 <b2a93cf2438d4c2799df3de516afa4f7@ukmail101.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b2a93cf2438d4c2799df3de516afa4f7-rlihkT9ojyHwKU+G0hyRhFaTQe2KTcn/@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Alexandre N. Perfeito" <perfeitoan-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>, Sai Gurrappadi <sgurrappadi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Deepak Nibade <dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Adding the linux-tegra ML as there are a few folk using this on there ...

Take a look at the following webpages [0][1], as this should help you.
Although it is booting from an external SD card, once you have this
working you should be able to write it to the internal eMMC.

Note that although the instructions [0] reference the chromeos kernel,
you should be able to use any mainline branch.

Cheers
Jon

[0] https://github.com/lgeek/gnu-linux-on-acer-chromebook-13
[1]
http://chromeos-cr48.blogspot.com/2013/10/chrubuntu-for-new-chromebooks-now-with.html

On 14/09/17 06:27, Arto Merilainen wrote:
> Hi Alexandre,
> 
>  
> 
> Unfortunately I cannot comment much on our customer products. I’d advise
> consulting Google ChromeOS team to get support on booting custom images
> on Tegra based Chromebooks.
> 
>  
> 
> - R2
> 
>  
> 
> *From:* Alexandre N. Perfeito [mailto:perfeitoan-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org]
> *Sent:* Wednesday, September 13, 2017 5:39 AM
> *To:* Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> Deepak Nibade <dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; Arto Merilainen
> <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; Sai Gurrappadi <sgurrappadi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> *Subject:* Compiling Mainline Kernel v4.4.70 Stable to ChormeBook Nvidia
> Tegra TK1 (Ubuntu-Xenial) -Uboot Not Booting (BlackScreen)
> 
>  
> 
> Hi All colaborators Nvidia-Tegra-124-Big-Nyan , My name is Alexander
> almost done here !!! I Need you Help !!! to make the chromebook TegraTk1
> model running Ubuntu-Xenial Mainline v4.4.0.70 distribution repo not
> ChromiumOS https://chromium.googlesource.com/chromiumos/third_party/kernel/+/v4.4.70
> 
>  
> 
>   After I compiled the Kernel and  zImage  with this:
> 
>  
> 
> root@alarm:/# sudo make |tegra_defconfig|
> 
> root@alarm:/#sudo make menuconfig
> 
> root@alarm:/#make savedefconfig
> root@alarm:/# sudo make -j5 zImage dtbs modules 
> 
>  
> 
>  *Second: *I caught this file in attached Then I runing this command:
> 
>  
> 
> 
> root@alarm:/# sudo_*/u-boot-tegra/b/nyan-big/tools/mkimage*_ -D "-I dts
> -O dtb -p 2048" -f *kernel.its *vmlinux.uimg
> 
>   Third:
> * 
> file* bootloader create with:
> 
>   
> 
> root@alarm:/#sudo dd if=/dev/zero of=bootloader.bin bs=512 count=1  -- >
> # dummy file
> 
>  
> *   *Fourth:
> *
> file *config.txt create with:
> 
> 
> echo 'console=tty0 init=/sbin/init root=PARTUUID=%U/PARTNROFF=1 rootwait
> rw noinitrd' > config.txt
> 
> and do this commands:
> 
>                          
> 
>  root@alarm:/#sudo make INSTALL_MOD_PATH=/lib/modules/4.4.0.70-ARCH
> modules_install
>  
> root@alarm:/#sudo make INSTALL_DTBS_PATH=/boot/dtbs" dtbs_install
> 
>  
> 
>  root@alarm:/#sudo depmod -F System.map "4.4.0.70-ARCH" 
> 
>  
> 
>     Fifth :
> 
> After the files created I runnig this scripth *file *_Kernel.sh_ below:
> 
> vbutil_kernel \
>     --pack vmlinux.kpart \
>     --version 1 \
>     --vmlinuz vmlinux.uimg \
>     --arch arm \
>     --keyblock  /usr/share/vboot/devkeys/kernel.keyblock \
>     --signprivate /usr/share/vboot/devkeys/kernel_data_key.vbprivk \
>     --config *config.txt *\
>     --bootloader *bootloader.bin*
> 
> 
> *file vmlinux.kpart created
> 
> *     Sixth : Put the file *vmlinux.kpart* in Kernel Partition *_/dev/sda6_*
> 
> root@alarm:/# sudo dd if=vmlinux.kpart of=/dev/sda6*
> 
> *      Seventh:
> 
> I copy this file *vmlinux.kpart*  in /boot from my USB drive Rootfs
> partition and zImage file
> 
> 
> 
> Follow my USB /dev/sda parttion:
> 
> [aperfeito@alarm ~]$ sudo cgpt show /dev/sda
> [sudo] password for aperfeito:
>        start        size            part           contents
>            0           1                                PMBR (Boot GUID:
> AD11024D-1016-B345-A21D-F7B823B0318A)
>            1           1                                Pri GPT header
>            2          32                               Pri GPT table
>           64       32768           6              Label: "KERN-A"
>                                                           Type: ChromeOS
> kernel
>                                                           UUID:
> D43B02E7-AF2D-3642-93D8-370D84193655
>                                                           Attr:
> priority=0 *tries=0* successful=0
>        65600    53542815     7             Label: "ROOT-A"
>                                                          Type:
> 0FC63DAF-8483-4772-8E79-3D69D8477DE4
>                                                          UUID:
> A01D12A1-C0E2-D54C-B68A-6E24E3896AE2
>     61997023          32                       Sec GPT table
>     61997055           1                        Sec GPT header
> 
>  
> 
> What I have doing wrong ? Chromebook Bleps one attempt when using ctlr+U
> or more than 0 (zero) *tries (Black Screen)*
> 
>  
> 
> Cheers
> 
>  
> 
> Perfeito, Alexander
> 
>  
> 

-- 
nvpublic
