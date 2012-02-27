From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] i2c: tegra: Remove unnecessary write to INT_STATUS
Date: Mon, 27 Feb 2012 10:02:55 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BD8BCF95@HQMAIL01.nvidia.com>
References: <1328314217-16632-1-git-send-email-swarren@nvidia.com>
 <1328314217-16632-2-git-send-email-swarren@nvidia.com>
 <20120213232427.GG2999@freya.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120213232427.GG2999-RazCHl0VsYgkUSuvROHNpA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Ben Dooks wrote at Monday, February 13, 2012 4:24 PM:
> On Fri, Feb 03, 2012 at 05:10:17PM -0700, Stephen Warren wrote:
> > From: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > The write is not necessary and may cause the I2C controller to misbehave.
> > With this fix, I2C on Tegra30 works (at least, running i2cdump repeatedly
> > on the WM8903 on Cardhu's I2C5/DVC bus).
> >
> > Originally by Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, but S-o-b missing in our
> > internal repo.
> >
> > [swarren: Reworded commit description]
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> I'll apply this as it seems to have gone by without major comment.

Ben, I haven't seen this show up in linux-next yet. I'm hoping the patch
will make 3.4. Thanks

-- 
nvpublic
