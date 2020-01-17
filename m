From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v3] mmc: tegra: fix SDR50 tuning override
Date: Fri, 17 Jan 2020 15:11:45 +0100
Message-ID: <20200117141145.GD26135@qmqm.qmqm.pl>
References: <9aff1d859935e59edd81e4939e40d6c55e0b55f6.1578390388.git.mirq-linux@rere.qmqm.pl>
 <CAPDyKFqXmbnH_NWZZTHHCE+Lt-f3JHAhJ8-=aoKNEPyQed44YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPDyKFqXmbnH_NWZZTHHCE+Lt-f3JHAhJ8-=aoKNEPyQed44YA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lucas Stach <dev@lynxeye.de>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 16, 2020 at 03:39:54PM +0100, Ulf Hansson wrote:
> On Tue, 7 Jan 2020 at 10:47, Micha³ Miros³aw <mirq-linux@rere.qmqm.pl> wrote:
> >
> > Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
> > broke SDR50 tuning override. Use correct NVQUIRK_ name.
> >
> > Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
> > Cc: <stable@vger.kernel.org> # 4f6aa3264af4: mmc: tegra: Only advertise UHS modes if IO regulator is present
> 
> I am dropping this tag, simply because I don't understand what it should tell.

It tells the maintainer that he needs to cherry-pick this commit if
its not in particular stable version already. I guess this is only
for v4.4, as v4.9+ already have it, and v3.16 does not include the
Fixed commit.

Best Regards,
Micha³ Miros³aw
