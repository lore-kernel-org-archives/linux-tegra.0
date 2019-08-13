From: Tom Murphy <murphyt7-/Zw1syy4LHg@public.gmane.org>
Subject: Re: [PATCH v4 0/5] iommu/amd: Convert the AMD iommu driver to the
	dma-iommu api
Date: Tue, 13 Aug 2019 20:09:26 +0800
Message-ID: <CALQxJuvxBc3MH3_B_fZ3FvURHOM3F3dvvZ6x=GtALUAvyu7Qxw@mail.gmail.com>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
	<20190624061945.GA4912@infradead.org>
	<20190810071952.GA25550@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4657264066316369039=="
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20190810071952.GA25550-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Philippe Brucker <jean-philippe.brucker-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Gross <agross-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerald Schaefer <gerald.schaefer-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--===============4657264066316369039==
Content-Type: multipart/alternative; boundary="000000000000c3526e058ffe83e2"

--000000000000c3526e058ffe83e2
Content-Type: text/plain; charset="UTF-8"

Hi Christoph,

I quit my job and am having a great time traveling South East Asia.

I definitely don't want this work to go to waste and I hope to repost it
later this week but I can't guarantee it.

Let me know if you need this urgently.

Thanks,
Tom

On Sat 10 Aug 2019, 3:20 p.m. Christoph Hellwig, <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:

> On Sun, Jun 23, 2019 at 11:19:45PM -0700, Christoph Hellwig wrote:
> > Tom,
> >
> > next time please cc Jerg as the AMD IOMMU maintainer.
> >
> > Joerg, any chance you could review this?  Toms patches to convert the
> > AMD and Intel IOMMU drivers to the dma-iommu code are going to make my
> > life in DMA land significantly easier, so I have a vested interest
> > in this series moving forward :)
>
> Tom, can you repost the series?  Seems like there hasn't been any
> news for a month.
>

--000000000000c3526e058ffe83e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Christoph,</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I quit my job and am having a great time traveling South East =
Asia.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I definitely=
 don&#39;t want this work to go to waste and I hope to repost it later this=
 week but I can&#39;t guarantee it.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Let me know if you need this urgently.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Tom</div><div dir=
=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sat 10 Aug 2019, 3:20 p.m. Christoph Hellwig, &lt;<a hr=
ef=3D"mailto:hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org">hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Sun, Jun 23, 2019 at 11:19:45PM -0700, Chr=
istoph Hellwig wrote:<br>
&gt; Tom,<br>
&gt; <br>
&gt; next time please cc Jerg as the AMD IOMMU maintainer.<br>
&gt; <br>
&gt; Joerg, any chance you could review this?=C2=A0 Toms patches to convert=
 the<br>
&gt; AMD and Intel IOMMU drivers to the dma-iommu code are going to make my=
<br>
&gt; life in DMA land significantly easier, so I have a vested interest<br>
&gt; in this series moving forward :)<br>
<br>
Tom, can you repost the series?=C2=A0 Seems like there hasn&#39;t been any<=
br>
news for a month.<br>
</blockquote></div></div></div>

--000000000000c3526e058ffe83e2--

--===============4657264066316369039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4657264066316369039==--
