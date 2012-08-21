From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Binding together tegradrm & nvhost
Date: Tue, 21 Aug 2012 09:35:14 +0300
Message-ID: <50332C22.7090009@nvidia.com>
References: <50323513.3090606@nvidia.com>  <1345525045.31608.145.camel@markz-desktop>  <50331F32.4040903@nvidia.com> <1345529528.31608.165.camel@markz-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345529528.31608.165.camel@markz-desktop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21.08.2012 09:12, Mark Zhang wrote:
> OK, thank you. In current version, all devices are created by
> "of_platform_populate" in board init function. So if we still need to
> define devices in dt, what's the benefit that we put these device
> creation works into host1x's probe function? I don't see any difference
> although create device in host1x probe() sounds more reasonable...

Until I have managed to integrate nvhost to tegradrm, the devices
creation should be done as it is done now. With nvhost, we will need
extra data per device, so we'll need to create the devices in nvhost.

> OK. So we have fence to sync all operations on a specific buffer. So
> this also means we should add fence support on GEM and dma-buf
> implementation both, right?

We'll have fences for operations, not buffers. User space must figure
out that if operation that reads from/writes to buffer is complete, the
buffer is ready to be reused.

Discussion in mm-sig attaches fences to buffers, which would cause a lot
of synchronization logic being added to kernel. Each operation can work
on multiple buffers, some in read-only, some in read-write, some in
write-only mode, so we'd end up returning an array of fences in a
complicated structure.

It's simpler if kernel just knows when operation ends, and lets user
space take care of the complexity.

Terje
