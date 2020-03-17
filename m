From: Kirill Timofeev <kt97679-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: kernel panic on the nvidia tegra tk1 board running nginx
Date: Tue, 17 Mar 2020 16:44:56 -0700
Message-ID: <CAG8jQEmNCcusJX2QK4OBNjiPJEc8U0amUtZcWCgsWtbx8H8eyA@mail.gmail.com>
References: <CAG8jQE=TtOVFm=0UdSpqf506G-4zWriZKnm2g2jV7kyTSf-TnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAG8jQE=TtOVFm=0UdSpqf506G-4zWriZKnm2g2jV7kyTSf-TnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ralf Ramsauer <ralf-ex4EvEgDZR1o7HI0AxOeTKwczVv4G7md@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi folks,

after some trial and error and with the help from Ralf Ramsauer
(thanks a bunch Ralf!) we figured out that removing CONFIG_ARM_LPAE
eliminates kernel panic. Here is the kernel config diff:

kvt@rage ~ $ diff kernel.config.old /usr/src/linux/.config
236d235
< CONFIG_ZONE_DMA=y
240c239
< CONFIG_PGTABLE_LEVELS=3
---
> CONFIG_PGTABLE_LEVELS=2
279d277
< # CONFIG_ARCH_AXXIA is not set
347c345
< CONFIG_ARM_LPAE=y
---
> # CONFIG_ARM_LPAE is not set
411a410
> # CONFIG_VMSPLIT_3G_OPT is not set
434a434
> CONFIG_CPU_SW_DOMAIN_PAN=y
436,437d435
< CONFIG_SYS_SUPPORTS_HUGETLBFS=y
< CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
567d564
< CONFIG_HAVE_RCU_TABLE_FREE=y
702d698
< CONFIG_HAVE_FAST_GUP=y
709d704
< CONFIG_PHYS_ADDR_T_64BIT=y
713d707
< # CONFIG_TRANSPARENT_HUGEPAGE is not set
728d721
< CONFIG_ARCH_HAS_PTE_SPECIAL=y
3369a3363
> # CONFIG_USB_FUSB300 is not set
4436d4429
< # CONFIG_LIBNVDIMM is not set
4537d4529
< # CONFIG_HUGETLBFS is not set
4801a4794
> # CONFIG_CRYPTO_DEV_HIFN_795X is not set
4883d4875
< CONFIG_ARCH_DMA_ADDR_T_64BIT=y
4887,4889d4878
< CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
< CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
< CONFIG_SWIOTLB=y
kvt@rage ~ $

Thanks,
Kirill.



On Wed, Feb 26, 2020 at 8:34 AM Kirill Timofeev <kt97679-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> I'm sorry if you will see this as a duplicate, resending as a plain
> text message.
>
> Hi folks,
>
> I run home server on the nvidia tegra tk1 using gentoo:
>
> Linux rage 5.5.6-gentoo #1 SMP PREEMPT Tue Feb 25 12:40:17 PST 2020
> armv7l ARMv7 Processor rev 3 (v7l) NVIDIA Tegra SoC (Flattened Device
> Tree) GNU/Linux
>
> This server runs nginx on both 80 and 443. I recently was updating my
> let's encrypt certificate and it failed because plain http was not
> working (while https was working ok):
>
> kvt@joy:~$ curl -s http://a0.twilightparadox.com|hd
> 00000000  89 1f 00 00 02 2e 00 00  00 00 00 00 9d 1f 00 00  |................|
> 00000010  02 2e 00 00 00 00 00 00  aa 1f 00 00 02 2e 00 00  |................|
> 00000020  00 00 00 00 b8 1f 00 00  02 2e 00 00 00           |.............|
> 0000002d
> kvt@joy:~$ curl -s https://a0.twilightparadox.com|hd
> 00000000  3c 68 74 6d 6c 3e 3c 62  6f 64 79 3e 55 6e 64 65  |<html><body>Unde|
> 00000010  72 20 63 6f 6e 73 74 72  75 63 74 69 6f 6e 3c 2f  |r construction</|
> 00000020  62 6f 64 79 3e 3c 2f 68  74 6d 6c 3e 0a           |body></html>.|
> 0000002d
> kvt@joy:~$
>
> I reverted kernel to 4.19.98 and everything worked fine with same
> settings. Locally everything works fine (with latest kernel):
>
> kvt@rage:~$ curl -s 127.0.0.1
> <html><body>Under construction</body></html>
> kvt@rage:~$
>
> The worst thing is that if I do local http call and then do external
> http call I'm getting kernel panic (please see file attached). This
> kernel panic was captured on 5.4.10 but I see same behavior with
> latest 5.5.6.
>
> If I shutdown nginx and run some other http server (e.g. python3 -m
> http.server) everything works fine.
>
> Just in case please find my kernel config attached.
>
> Please let me know if something is wrong with my kernel config or if I
> need to provide any additional information.
>
> Thanks,
> Kirill.
