From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] pci: tegra: Revert raw_violation_fixup for tegra124
Date: Mon, 20 Jul 2020 12:30:08 +0100
Message-ID: <20200720113008.GA25297@e121166-lin.cambridge.arm.com>
References: <20200717213510.171726-1-kwizart@gmail.com>
 <20200717215304.GA775582@bjorn-Precision-5520>
 <CABr+WTkJ8jZDkM_=-LYxpbrqrsPEb96YBRJvBjR5u+0Ck9R4CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABr+WTkJ8jZDkM_=-LYxpbrqrsPEb96YBRJvBjR5u+0Ck9R4CQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 20, 2020 at 09:02:59AM +0200, Nicolas Chauvet wrote:
> Le ven. 17 juil. 2020 à 23:53, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> a écrit :
> >
> Thanks for the quick review. I've addressed all comments and I've
> resubmitted a v2 to
> https://www.spinics.net/lists/linux-pci/msg96863.html
> Unfortunately I've missed to modify the [Patch v2] tag. I hope this is
> fine. Let me know if I need to resend.
> 
> > Is v5.4.x really the oldest kernel that should get this fix?  It looks
> > like 191cd6fb5d2c appeared in v5.3.
> The commit was introduced in 5.3 indeed. I've added 5.4.x since it's
> the last maintained kernel from long term branches.
> Now I'm using the Fixes: tag, I've dropped the version of the kernel
> for stable as it seems duplicate and less accurate.

I have applied this patch to pci/tegra, thanks.

Lorenzo
