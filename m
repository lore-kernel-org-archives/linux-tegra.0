From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dmaengine: tegra210-adma: Add memcpy support
Date: Tue, 6 Sep 2016 10:21:28 -0700
Message-ID: <20160906172127.GA966@Asurada-Nvidia>
References: <cover.1472857934.git.nicoleotsuka@gmail.com>
 <738e0f1560436d613d9a7dab2fd540abea9503d3.1472857934.git.nicoleotsuka@gmail.com>
 <f9850c0c-a4a9-4d5f-eaa9-c1fd39b72870@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f9850c0c-a4a9-4d5f-eaa9-c1fd39b72870-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 06, 2016 at 12:52:03PM +0100, Jon Hunter wrote:
> > +	/* TODO: ADMA should support up to 8 chunks or periods */
> > +	desc->num_periods = 1;
> > +	desc->buf_len = buf_len;
> > +	desc->period_len = buf_len;

> What would be the benefit of using 8 periods here? My understanding is
> that you will get an interrupt per period and do you really want this
> for memcpy?

You are right about the interrupt. And it doesn't seem to be
beneficial unless the period size is over the limitation of
Transfer Count, which is rare but might theoretically exist?

I admit the "TODO" word here is a bit misleading for memcpy.
I can remove the word and write a more appropriate comments.
