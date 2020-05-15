From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/6] partitions/efi: Support GPT entry lookup at a
 non-standard location
Date: Fri, 15 May 2020 18:52:53 +0300
Message-ID: <2633429b-f014-15ea-c08c-d2157b0177b1@gmail.com>
References: <20200515014143.12984-1-digetx@gmail.com>
 <20200515014143.12984-5-digetx@gmail.com>
 <20200515100320.GB30674@tack.einval.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515100320.GB30674-RWaXQMOneMVkKwkEErXb8g@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve McIntyre <steve-nt0JYOx6u4DQT0dZR+AlfA@public.gmane.org>
Cc: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Nils_=c3=96stlund?= <nils-ElENwYY5mljQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan@ed>
List-Id: linux-tegra@vger.kernel.org

15.05.2020 13:03, Steve McIntyre пишет:
> On Fri, May 15, 2020 at 04:41:41AM +0300, Dmitry Osipenko wrote:
>> Most of consumer-grade NVIDIA Tegra devices use a proprietary bootloader
>> that can't be easily replaced because it's locked down using Secure Boot
>> cryptography singing and the crypto keys aren't given to a device owner.
>               ^^^^^^^ typo
>> These devices usually have eMMC storage that is partitioned using a custom
>> NVIDIA Tegra partition table format.  Of course bootloader and other
>> "special things" are stored on the eMMC storage, and thus, the partition
>> format can't be changed.
> 
> ...
> 

Thanks! I'll correct it in v5.
