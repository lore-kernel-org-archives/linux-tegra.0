From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 03/10] partitions: Introduce NVIDIA Tegra Partition
 Table
Date: Mon, 23 Mar 2020 22:59:52 +0300
Message-ID: <67140755-c829-5c58-3fbf-efd496e225df@gmail.com>
References: <20200323163431.7678-1-digetx@gmail.com>
 <20200323163431.7678-4-digetx@gmail.com>
 <20200323191748.GB30585@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <20200323191748.GB30585@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-mmc-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.03.2020 22:17, Michał Mirosław пишет:
> On Mon, Mar 23, 2020 at 07:34:24PM +0300, Dmitry Osipenko wrote:
>> All NVIDIA Tegra devices use a special partition table format for the
>> internal storage partitioning. Most of Tegra devices have GPT partition
>> in addition to TegraPT, but some older Android consumer-grade devices do
>> not or GPT is placed in a wrong sector, and thus, the TegraPT is needed
>> in order to support these devices properly in the upstream kernel. This
>> patch adds support for NVIDIA Tegra Partition Table format that is used
>> at least by all NVIDIA Tegra20 and Tegra30 devices.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  arch/arm/mach-tegra/tegra.c   |  54 ++++
> [...]
> 
> Please split off this part and make the information available to
> userspace (pt_addr + pt_size) if found. This would make it easier
> to support use the partition table later in initrd instead.

Please clarify what do you mean by "use the partition table later in
initrd instead".
