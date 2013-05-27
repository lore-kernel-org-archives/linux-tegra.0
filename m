From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] gpu: host1x: Fix syncpoint wait return value
Date: Mon, 27 May 2013 09:55:46 +0300
Message-ID: <51A30372.6080907@nvidia.com>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com> <1368791388-31441-3-git-send-email-amerilainen@nvidia.com> <20130526101243.GB1652@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130526101243.GB1652@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/26/2013 01:12 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Fri, May 17, 2013 at 02:49:44PM +0300, Arto Merilainen wrote:
>> Syncpoint wait returned EAGAIN if it was called with zero timeout.
>> This patch modifies the function to return ETIMEDOUT.
>
> This description is a bit redundant, because it repeats in prose what
> the code does. I'd rather see a description of why the change is
> necessary.

True. Will fix.

>
> Thinking about it, maybe it would be good to have two separate error
> codes. Keeping -EAGAIN for the case where a zero timeout was passed
> doesn't sound too bad to differentiate it from the case where a non-
> zero timeout was passed and it actually timed out. What do you think?

I agree, in this case it would not look bad at all. However, user space 
libraries may loop until the ioctl return code is something else than 
-EAGAIN or -EINTR. Especially function drmIoctl() in libdrm does this 
which is why I noted this isssue in the first place.

If user space uses zero timeout to just check if a syncpoint value has 
already passed the library continues looping until the syncpoint value 
actually passes. Of course, we could just modify the ioctl interface to 
"cast" this return code to something else but that does not seem correct.

- Arto
