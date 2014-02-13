From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: How to use host1x syncpt?
Date: Thu, 13 Feb 2014 13:36:08 +0200
Message-ID: <52FCAE28.5080508@nvidia.com>
References: <CAK5ve-+ARW3cx+671vNYQCWYPe=CVa5n81q2-BrKyGzF8Nv4fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK5ve-+ARW3cx+671vNYQCWYPe=CVa5n81q2-BrKyGzF8Nv4fw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05.02.2014 01:51, Bryan Wu wrote:
> Hi Stephen and Thierry,
> 
> Recently I'm working on upstreaming my V4L2 driver for Tegra video
> input module, which is using host1x syncpt to wait for frame
> capturing.
> 
> So here is my basic steps for handling host1x syncpt,
> 
> 1. Call host1x_syncpt_request(cam->client.dev, flags); to allocate
> syncpts for my driver.
> 
> 2. Program host1x_syncpt_id(sp) into Tegra VI syncpt event register.
> So when VI captures one frame, syncpt will be increased one.
> 
> 3. Call thresh = host1x_syncpt_incr_max(sp, 1) to incr max_val of the
> syncpt, which is the threshold for waiting.
> 
> 4. Start capture and wait for host1x syncpt event like this
> host1x_syncpt_wait(sp, thresh, WAIT_TIMEOUT, &value);
> 
> Is that the right sequence?

You should get the correct syncpt fence value by calling
host1x_syncpt_incr_max(). It seems we've just forgotten to export it,
but you can add a trivial patch to export that function.

If you don't do this, host1x will treat your sync point value as "out of
valid range", consider it an outdated one, and treat any waits as NOP.

Terje
