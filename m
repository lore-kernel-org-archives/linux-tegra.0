From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v3 03/10] partitions: Introduce NVIDIA Tegra Partition
 Table
Date: Mon, 23 Mar 2020 22:35:20 +0100
Message-ID: <20200323213520.GA16587@qmqm.qmqm.pl>
References: <20200323163431.7678-1-digetx@gmail.com>
 <20200323163431.7678-4-digetx@gmail.com>
 <20200323191748.GB30585@qmqm.qmqm.pl>
 <67140755-c829-5c58-3fbf-efd496e225df@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <67140755-c829-5c58-3fbf-efd496e225df@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 23, 2020 at 10:59:52PM +0300, Dmitry Osipenko wrote:
> 23.03.2020 22:17, Michał Mirosław пишет:
> > On Mon, Mar 23, 2020 at 07:34:24PM +0300, Dmitry Osipenko wrote:
> >> All NVIDIA Tegra devices use a special partition table format for the
> >> internal storage partitioning. Most of Tegra devices have GPT partition
> >> in addition to TegraPT, but some older Android consumer-grade devices do
> >> not or GPT is placed in a wrong sector, and thus, the TegraPT is needed
> >> in order to support these devices properly in the upstream kernel. This
> >> patch adds support for NVIDIA Tegra Partition Table format that is used
> >> at least by all NVIDIA Tegra20 and Tegra30 devices.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  arch/arm/mach-tegra/tegra.c   |  54 ++++
> > [...]
> > 
> > Please split off this part and make the information available to
> > userspace (pt_addr + pt_size) if found. This would make it easier
> > to support use the partition table later in initrd instead.
> 
> Please clarify what do you mean by "use the partition table later in
> initrd instead".

Configure device-mapper to span eMMC boot+data partitions and then ask
(modified) kpartx to partition the resulting device. All before rootfs
is mounted and switched to in initrd.

Best Regards
Michał Mirosław
