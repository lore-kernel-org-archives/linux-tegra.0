From: Lucas Stach <dev@lynxeye.de>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Fri, 30 Nov 2012 09:50:29 +0100
Message-ID: <1354265429.1479.187.camel@tellur>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-2-git-send-email-tbergstrom@nvidia.com>
	<20121128212301.GA25531@avionic-0098.adnet.avionic-design.de>
	<50B73710.2040102@nvidia.com>
	<20121129114704.GB6150@avionic-0098.adnet.avionic-design.de>
	<50B7AB93.5060207@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <50B7AB93.5060207@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Terje =?ISO-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

Am Donnerstag, den 29.11.2012, 11:38 -0700 schrieb Stephen Warren:
> On 11/29/2012 04:47 AM, Thierry Reding wrote:
> > I agree. But I also fear that there will be changes eventually and 
> > having both go in via different tree requires those trees to be
> > merged in a specific order to avoid breakage should the API change.
> > This will be particularly ugly in linux-next.
> > 
> > That's why I explicitly proposed to take this into
> > drivers/gpu/drm/tegra for the time being, until we can be
> > reasonably sure that the API is fixed. Then I'm fine with moving it
> > wherever seems the best fit. Even then there might be the
> > occasional dependency, but they should get fewer and fewer as the
> > code matures.
> 
> It is acceptable for one maintainer to ack patches, and another
> maintainer to merge a series that touches both "their own" code and
> code owned by another tree. This should of course only be needed when
> inter-module APIs change; changes to code within a module shouldn't
> require this.
> 

I'm with Thierry here. I think there is a fair chance that we won't get
the API right from the start, even when trying to come up with something
that sounds sane to everyone. It's also not desirable to delay gr2d
going into mainline until we are all completely satisfied with the API.

I also fail to see how host1x module being in the DRM directory hinders
any downstream development. So I'm in favour of keeping host1x besides
the other DRM components to lower the burden for API changes and move it
out into some more generic directory, once we feel confident that the
API is reasonable stable.

Regards,
Lucas 
