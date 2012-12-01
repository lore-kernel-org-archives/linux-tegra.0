From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 0/8] Support for Tegra 2D hardware
Date: Sat, 1 Dec 2012 19:08:12 +0200
Message-ID: <50BA397C.7050707@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <20121201144512.GA18209@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121201144512.GA18209-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01.12.2012 16:45, Thierry Reding wrote:
> I did some prototyping on how a libdrm API could look like a few weeks
> back. I should clean the patches up some and push them to a public
> repository or to the mailing lists for review.

Ok. Sorry about the delay - I recently learned I need separate
permission for user space contribution, so I'm pushing to get that
permission.

> There isn't actually much more than a bit of framework along with two
> IOCTLs that allow creating and looking up a Tegra-specific GEM. The
> related kernel patches aren't available anywhere since I didn't deem
> them ready yet. At that time I wasn't even sure if we'd need special
> allocations other than what the dumb BO infrastructure provides. They
> implement some parts of what you've implemented in this series as well,
> with some slight differences.

Ok, the BO infra is still under flux as we're designing the best place
and work split.

> Currently these still use the CMA-backed GEM objects but it should be
> easy to switch to something backed by the host1x infrastructure once
> that's in good shape.

Sounds good.

> While I can't find the quote right now, I seem to remember that you said
> at some point that you were planning on adding some 2D acceleration bits
> to libdrm. I don't think that's the right place. That code should rather
> go into the DDX. libdrm should instead provide a thin layer on top of
> the DRM IOCTLs to manage buffers and submit command streams. I hope I
> can finish the cleanup of my libdrm patches over the weekend and push
> them out so this may become clearer. Maybe I can even get the
> corresponding kernel patches pushed out.

Yep, that's exactly what I actually posed as a question in one of the
earlier mails. We also agree that 2D bits should not stay in libdrm.
That's why we've kept the 2D bits design-wise separate from the host1x
stream generation.

We don't yet have any other place to put 2D functions in, so we'll
probably post them as part of patch series to libdrm. We'll just add a
disclaimer that the 2D code won't remain in libdrm, and wanted to get
the code out to review as a code example. We can put the 2D code either
to a separate library or to DDX, whichever is preferred.

The host1x command stream generation would still remain in libdrm. That
seems to be the pattern with other hardware.

Best regards,
Terje
