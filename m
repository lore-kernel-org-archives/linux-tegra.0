From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 37/38] dt-bindings: pwm: Explicitly include pwm.yaml
Date: Wed, 17 Jun 2020 20:51:40 -0600
Message-ID: <20200618025140.GB3378010@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-38-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-38-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:19:02PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> For PWM controller device tree bindings, make sure that they include the
> pwm.yaml controller core bindings explicitly. This prevents the tooling
> from matching on the $nodename pattern, which can falsely match things
> like pinmux nodes, etc.

My preference here is to clean-up the mess that is pinmux nodes.

This has the side effect of no longer checking pwm nodes that didn't 
have explicit schema. Perhaps that's of somewhat limited value.

Rob
