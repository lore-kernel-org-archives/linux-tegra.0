From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] partitions/efi: Add 'gpt_sector' kernel cmdline
 parameter
Date: Mon, 24 Feb 2020 21:22:34 +0300
Message-ID: <eb1e3a64-b1ac-94d0-07f7-c84a83d9b21e@gmail.com>
References: <20200219162339.16192-1-digetx@gmail.com>
 <20200219162738.GA10644@infradead.org>
 <f9e41108-7811-0deb-6977-be0f60e23b52@wwwdotorg.org>
 <20200224163342.d4acf224b56celup@ws.net.home>
 <9c7343eb-1b09-ffcf-cba0-11d6a26dfd77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9c7343eb-1b09-ffcf-cba0-11d6a26dfd77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karel Zak <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

24.02.2020 20:23, Dmitry Osipenko пишет:
> 24.02.2020 19:33, Karel Zak пишет:
>> On Wed, Feb 19, 2020 at 09:59:54AM -0700, Stephen Warren wrote:
>>> On 2/19/20 9:27 AM, Christoph Hellwig wrote:
>>>> On Wed, Feb 19, 2020 at 07:23:39PM +0300, Dmitry Osipenko wrote:
>>>>> The gpt_sector=<sector> causes the GPT partition search to look at the
>>>>> specified sector for a valid GPT header if the GPT is not found at the
>>>>> beginning or the end of block device.
>>>>>
>>>>> In particular this is needed for NVIDIA Tegra consumer-grade Android
>>>>> devices in order to make them usable with the upstream kernel because
>>>>> these devices use a proprietary / closed-source partition table format
>>>>> for the EMMC and it's impossible to change the partition's format. Luckily
>>>>> there is a GPT table in addition to the proprietary table, which is placed
>>>>> in uncommon location of the EMMC storage and bootloader passes the
>>>>> location to kernel using "gpt gpt_sector=<sector>" cmdline parameters.
>>>>>
>>>>> This patch is based on the original work done by Colin Cross for the
>>>>> downstream Android kernel.
>>>>
>>>> I don't think a magic command line is the way to go.  The best would be
>>>> to reverse-engineer the proprietary partition table format.  If that is
>>>> too hard we can at least key off the odd GPT location based of it's
>>>> magic number.
>>
>>  +1
>>
>>> I thought that the backup GPT was always present in the standard location;
>>
>> If they have proprietary stuff on begin of the device and valid backup
>> GPT at the end of the device then designer of this junk is crazy, because
>> many GPT fdisk-like tools will try to recover from the backup header and 
>> overwrite the unknown (invalid) stuff at the begin of the device...
> 
> It's a problem created by vendor, but these devices are assumed to run
> Android-only. So it's not really that bad :)
> 

Is there any way to mark parts of block device as read-only? Such that
userspace couldn't write to the RO-marked sectors, I guess that could
help to save someone's bacon.
