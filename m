From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v3 00/10] Introduce NVIDIA Tegra Partition Table
Date: Mon, 23 Mar 2020 19:07:50 +0100
Message-ID: <20200323180750.GA30585@qmqm.qmqm.pl>
References: <20200323163431.7678-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200323163431.7678-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 23, 2020 at 07:34:21PM +0300, Dmitry Osipenko wrote:
> Some NVIDIA Tegra devices have GPT entry at a wrong location and others may
> even not have it at all. So either a custom workaround for GPT parsing or
> TegraPT support is needed for those devices if we want to support them in
> upstream kernel. The former solution was already rejected [1], let's try
> the latter.
[...]

Hi Dmitry,

This amusing use of whole-device offsets in the TegraPT makes it take
a lot of hacks to support it. Have you considered to first join the MMC
hardware partitions using DM and its linear target and only then processing
the partition table dividing just the merged device?

Best Regards,
Micha³ Miros³aw
