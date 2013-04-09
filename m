From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9b 10/14] ARM: tegra: Define Tegra114 CAR binding
Date: Mon, 08 Apr 2013 21:25:37 -0700
Message-ID: <20130409042537.14359.94241@quantum>
References: <1365097717-11874-1-git-send-email-pdeschrijver@nvidia.com>
 <515DBE24.3090501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515DBE24.3090501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Warren (2013-04-04 10:53:40)
> On 04/04/2013 11:48 AM, Peter De Schrijver wrote:
> > The device tree binding models Tegra114 CAR (Clock And Reset) as a single
> > monolithic clock provider.
> > 
> > --
> > 
> > Mike,
> > 
> > This is a small binding doc update only. Hence I didn't make an entire new
> > patch series, but just an updated version of this patch. Please apply this
> > instead of '[PATCH v9 10/14] ARM: tegra: Define Tegra114 CAR binding'
> > (http://www.spinics.net/lists/linux-tegra/msg10910.html).
> > The rest of the series is not affected. 
> 
> I believe I was planning to take this series through the Tegra tree, so
> I'm more looking for Mikes ack than for him to apply this.
> 
> If that's changed, there are some other Tegra clock bug-fixes that'd
> benefit from moving to the clock tree.

I forgot to reply to this one last week with the rest of the v9 series.
This patch update also has my ack.

Regards,
Mike
