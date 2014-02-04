From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: How to use host1x syncpt?
Date: Tue, 4 Feb 2014 15:51:24 -0800
Message-ID: <CAK5ve-+ARW3cx+671vNYQCWYPe=CVa5n81q2-BrKyGzF8Nv4fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen and Thierry,

Recently I'm working on upstreaming my V4L2 driver for Tegra video
input module, which is using host1x syncpt to wait for frame
capturing.

So here is my basic steps for handling host1x syncpt,

1. Call host1x_syncpt_request(cam->client.dev, flags); to allocate
syncpts for my driver.

2. Program host1x_syncpt_id(sp) into Tegra VI syncpt event register.
So when VI captures one frame, syncpt will be increased one.

3. Call thresh = host1x_syncpt_incr_max(sp, 1) to incr max_val of the
syncpt, which is the threshold for waiting.

4. Start capture and wait for host1x syncpt event like this
host1x_syncpt_wait(sp, thresh, WAIT_TIMEOUT, &value);

Is that the right sequence?

host1x_syncpt_incr_max() is not exported and without calling it I
always got error message like this:
"tegra-host1x 50000000.host1x: syncpt_load failed: id=1, min=46, max=0, live=46"
So I have to increase the max_val manually like step 3. And
host1x_syncpt_incr() won't increase the max_val which will still
generate this error message.

Actually with the steps I listed, I can capture data from real sensor now.

Thanks,
-Bryan
