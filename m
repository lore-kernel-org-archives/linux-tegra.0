From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] media: staging: tegra-vde: Use
 devm_platform_ioremap_resource_byname()
Date: Mon, 2 Mar 2020 18:04:20 +0300
Message-ID: <d748bf2c-e38c-dabb-59ad-39e14813e40a@gmail.com>
References: <20200227180915.9541-1-digetx@gmail.com>
 <20200302080456.GD4140@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200302080456.GD4140@kadam>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

02.03.2020 11:04, Dan Carpenter пишет:
> On Thu, Feb 27, 2020 at 09:09:15PM +0300, Dmitry Osipenko wrote:
>> This helps to make code cleaner a tad.
> 
> Please don't start the commit message in the middle of a sentence.

Could you please clarify what do you mean by the "middle of a sentence"?
The commit's message doesn't sound "middle" to me at all.

> It looks like this for some of us:
> 
> https://marc.info/?l=linux-driver-devel&m=158282701430176&w=2

This link points to this patch, I don't quite understand what you're
trying to convey here.

> I generally read the subject or the full commit message but seldom
> both.

The commit's title describes the change briefly, while the message gives
a rational for the change. Usually reviewer should consult the code
changes themselves for more details.

Do you have some kind of a email filter that shows only the commit's
message? Otherwise I'm not sure what's the problem.

> Otherwise the patch looks very good.

Thanks
