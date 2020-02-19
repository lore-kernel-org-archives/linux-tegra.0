From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] partitions/efi: Add 'gpt_sector' kernel cmdline
 parameter
Date: Wed, 19 Feb 2020 20:44:40 +0300
Message-ID: <0c0d0cff-7b20-f777-8724-0d2b07e60e3d@gmail.com>
References: <20200219162339.16192-1-digetx@gmail.com>
 <20200219162738.GA10644@infradead.org>
 <f9e41108-7811-0deb-6977-be0f60e23b52@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f9e41108-7811-0deb-6977-be0f60e23b52@wwwdotorg.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Davidlohr Bueso <dave@stgolabs.net>, Colin Cross <ccross@android.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, linux-efi@vger.kernel.org, linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.02.2020 19:59, Stephen Warren пишет:
> On 2/19/20 9:27 AM, Christoph Hellwig wrote:
>> On Wed, Feb 19, 2020 at 07:23:39PM +0300, Dmitry Osipenko wrote:
>>> The gpt_sector=<sector> causes the GPT partition search to look at the
>>> specified sector for a valid GPT header if the GPT is not found at the
>>> beginning or the end of block device.
>>>
>>> In particular this is needed for NVIDIA Tegra consumer-grade Android
>>> devices in order to make them usable with the upstream kernel because
>>> these devices use a proprietary / closed-source partition table format
>>> for the EMMC and it's impossible to change the partition's format.
>>> Luckily
>>> there is a GPT table in addition to the proprietary table, which is
>>> placed
>>> in uncommon location of the EMMC storage and bootloader passes the
>>> location to kernel using "gpt gpt_sector=<sector>" cmdline parameters.
>>>
>>> This patch is based on the original work done by Colin Cross for the
>>> downstream Android kernel.
>>
>> I don't think a magic command line is the way to go.  The best would be
>> to reverse-engineer the proprietary partition table format.  If that is
>> too hard we can at least key off the odd GPT location based of it's
>> magic number.
> 
> I thought that the backup GPT was always present in the standard
> location; it's just the primary GPT that's in an odd location. So, this
> kernel parameter just forces the kernel to look first for the primary
> GPT in the unusual location, thus avoiding an error message when that's
> not there, and the system falls back to the backup GPT.
> 
> Or, do I misremember the layout, or the kernel's behaviour if primary
> GPT is missing?

The backup GPT not always presents in the standard location. For example
Tegra30 ASUS Google Nexus 7 has a backup GPT in the proper location and
this is what KMSG prints:

[    1.722888] Primary GPT is invalid, using alternate GPT.
[    1.723076]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10

But this doesn't work for Tegra20 Acer A500 and (IIRC) Tegra30 Ouya
because both primary and backup GPTs are invalid at the standard locations.
