From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH v3 03/10] partitions: Introduce NVIDIA Tegra Partition
 Table
Date: Tue, 24 Mar 2020 21:52:21 +0100
Message-ID: <20200324205221.GA22063@qmqm.qmqm.pl>
References: <20200323163431.7678-1-digetx@gmail.com>
 <20200323163431.7678-4-digetx@gmail.com>
 <20200323191748.GB30585@qmqm.qmqm.pl>
 <67140755-c829-5c58-3fbf-efd496e225df@gmail.com>
 <20200323213520.GA16587@qmqm.qmqm.pl>
 <c31a0335-a174-0f45-af03-3267710a8205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c31a0335-a174-0f45-af03-3267710a8205-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 24, 2020 at 02:22:34AM +0300, Dmitry Osipenko wrote:
> 24.03.2020 00:35, Michał Mirosław пишет:
> > On Mon, Mar 23, 2020 at 10:59:52PM +0300, Dmitry Osipenko wrote:
> >> 23.03.2020 22:17, Michał Mirosław пишет:
> >>> On Mon, Mar 23, 2020 at 07:34:24PM +0300, Dmitry Osipenko wrote:
> >>>> All NVIDIA Tegra devices use a special partition table format for the
> >>>> internal storage partitioning. Most of Tegra devices have GPT partition
> >>>> in addition to TegraPT, but some older Android consumer-grade devices do
> >>>> not or GPT is placed in a wrong sector, and thus, the TegraPT is needed
> >>>> in order to support these devices properly in the upstream kernel. This
> >>>> patch adds support for NVIDIA Tegra Partition Table format that is used
> >>>> at least by all NVIDIA Tegra20 and Tegra30 devices.
> >>>>
> >>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>> ---
> >>>>  arch/arm/mach-tegra/tegra.c   |  54 ++++
> >>> [...]
> >>>
> >>> Please split off this part and make the information available to
> >>> userspace (pt_addr + pt_size) if found. This would make it easier
> >>> to support use the partition table later in initrd instead.
> >>
> >> Please clarify what do you mean by "use the partition table later in
> >> initrd instead".
> > 
> > Configure device-mapper to span eMMC boot+data partitions and then ask
> > (modified) kpartx to partition the resulting device. All before rootfs
> > is mounted and switched to in initrd.
> 
> The whole point of this series is to make partition handling generic in
> the kernel, avoiding the need to customize anything.

Yes, but at least for diagnostic purposes, it would be nice to have the
values from BCT exposed somewhere in /sys.

Best Regards,
Michał Mirosław
