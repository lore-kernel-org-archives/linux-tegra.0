From: Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v2 1/2] drm: constify edid handling functions
Date: Wed, 16 Jan 2013 17:03:30 +0100
Message-ID: <1358352210.3157.8.camel@tellur>
References: <1358347002-10999-1-git-send-email-dev@lynxeye.de>
	<20130116152355.GA965@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130116152355.GA965@avionic-0098.adnet.avionic-design.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 16.01.2013, 16:23 +0100 schrieb Thierry Reding:
> On Wed, Jan 16, 2013 at 03:36:41PM +0100, Lucas Stach wrote:
> [...]
> > @@ -705,7 +705,7 @@ static int standard_timing_level(struct edid *edid)
> >   * monitors fill with ascii space (0x20) instead.
> >   */
> >  static int
> > -bad_std_timing(u8 a, u8 b)
> > +bad_std_timing(const u8 a, const u8 b)
> >  {
> >  	return (a == 0x00 && b == 0x00) ||
> >  	       (a == 0x01 && b == 0x01) ||
> 
> Was this intended to go in here?
> 
> > @@ -721,8 +721,8 @@ bad_std_timing(u8 a, u8 b)
> >   * and convert them into a real mode using CVT/GTF/DMT.
> >   */
> >  static struct drm_display_mode *
> > -drm_mode_std(struct drm_connector *connector, struct edid *edid,
> > -	     struct std_timing *t, int revision)
> > +drm_mode_std(struct drm_connector *connector, const struct edid *edid,
> > +	     const struct std_timing *t, int revision)
> >  {
> >  	struct drm_device *dev = connector->dev;
> >  	struct drm_display_mode *m, *mode = NULL;
> 
> I know I'm being picky, but you're constifying the t parameter here as
> well without saying so in the commit message.
> 
Yes, probably I should have been a bit more elaborate in the commit
message. Both hunks are intentional, as I looked at how those functions
in the environment of the edid handling funcs are used and added const
where appropriate, not just strictly to the struct edid pointer.

Regards,
Lucas
