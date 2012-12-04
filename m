From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Tue, 04 Dec 2012 09:49:41 +0800
Message-ID: <50BD56B5.701@gmail.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com> <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com> <50BC7118.9060407@gmail.com> <CAKMK7uF-sQ-HzA2Zek4VzWky=69LA3JqJR_+kyRQEO-JgwPQXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKMK7uF-sQ-HzA2Zek4VzWky=69LA3JqJR_+kyRQEO-JgwPQXQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/03/2012 05:40 PM, Daniel Vetter wrote:
> On Mon, Dec 3, 2012 at 10:30 AM, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> I'm new in kernel development. Could you tell me or give me some
>> materials to read that why we need to align the size of IOCTL structures
>> to 64bit? I can understand if we're working in a 64bit kernel but why we
>> need to do this if we're in a 32bit arm kernel? Besides, why the
>> pointers in IOCTL structure should be declared as u64?
> 
> Because in a few years/months you'll have arm64, but still the same
> driver with the same ioctls ... and if the ioctls are not _exactly_
> the same you get to write compat ioctl code which copies the old 32bit
> struct into the 64bit struct the kernel understands. Hence your ioctl
> must be laid out exactly the same for both 32bit and 64bit, which
> happens if you naturally align/pad everything to 64bits and only use
> fixed-sized integers and no pointers.

Ah, I see. Thanks. Yes, u64 still works as 32 bit pointer.

Mark
> -Daniel
> 
