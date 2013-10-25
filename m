From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: [PATCH] tps65090-charger: Use "IS_ENABLED(CONFIG_OF)" for DT
 code.
Date: Fri, 25 Oct 2013 16:08:50 -0700
Message-ID: <20131025230850.GA9015@teo>
References: <1380342744-4227-1-git-send-email-badarkhe.manish@gmail.com>
 <5249A0DC.9030206@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5249A0DC.9030206@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Manish Badarkhe <badarkhe.manish@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 30, 2013 at 12:03:40PM -0400, Rhyland Klein wrote:
> On 9/28/2013 12:32 AM, Manish Badarkhe wrote:
> > Instead of "#if defined(CONFIG_OF)" use "IS_ENABLED(CONFIG_OF)" option
> > for DT code to avoid if-deffery in code.
> > Also, arranged header files in alphabetically.
> > 
> > Signed-off-by: Manish Badarkhe <badarkhe.manish@gmail.com>
> > ---
> > :100644 100644 bdd7b9b... 8b9c406... M	drivers/power/tps65090-charger.c
> >  drivers/power/tps65090-charger.c |   19 +++++--------------
> >  1 file changed, 5 insertions(+), 14 deletions(-)
> LGTM
> Acked-by: Rhyland Klein <rklein@nvidia.com>

Applied, thanks!

Anton
