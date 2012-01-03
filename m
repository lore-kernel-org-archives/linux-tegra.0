From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Input: tegra-kbc - add device tree bindings
Date: Tue, 3 Jan 2012 12:58:39 -0800
Message-ID: <CAOesGMg_MKGenRyTa9PkSLvV3CsWxYcY=sGb5awPQn=9Ng8ENQ@mail.gmail.com>
References: <1325053170-6984-1-git-send-email-olof@lixom.net>
	<1325053170-6984-2-git-send-email-olof@lixom.net>
	<20120102081828.GB18381@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120102081828.GB18381-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rakesh Iyer <riyer-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 2, 2012 at 12:18 AM, Grant Likely <grant.likely@secretlab.c=
a> wrote:

> I'd like to see a "tegra," prefix on these custom properties, but oth=
erwise
> the binding looks okay to me. =A0You should also consider a '-ms' suf=
fix on
> the millisecond properties.

Ok, I added "nvidia," prefix for the properties, and pushed down the
linux,fn-keymap binding to this level (but I left the implementation
as a FIXME).

> Otherwise;
>
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Thanks, added and I'll repost the patch together with the shared
binding in a bit.


-Olof
