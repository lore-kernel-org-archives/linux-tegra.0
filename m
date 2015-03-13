From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] pmu/gk20a: PMU boot support.
Date: Fri, 13 Mar 2015 10:56:26 +0900
Message-ID: <CAAVeFuJi2tSwuRyU+-yp3OQ_Un7J_--S=7VgPCatpGk_JJ6BdQ@mail.gmail.com>
References: <1426055631-1166-1-git-send-email-dgoyal@nvidia.com>
 <CAKb7Uvj0xMvDWjKjGzbD6Tk0NArfkh4Vjvt4eRQ8XoHgR+7bsg@mail.gmail.com>
 <25b5050176544f47b0ac74d4086f145c@bgmail104.nvidia.com> <CAKb7UvgDq-FzZwAZ8VwbhaVHi4B29jXL5qjOCQ47TWfqDBDQaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKb7UvgDq-FzZwAZ8VwbhaVHi4B29jXL5qjOCQ47TWfqDBDQaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Deepak Goyal <dgoyal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 13, 2015 at 7:11 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> I guess Alexandre will help you prepare this for upstream inclusion,
> but just want to make sure that my main point makes it across -- this
> is a 3K line patch. Please try to split it up into patches that add no
> more than 300 lines at a time, preferably fewer (but this isn't always
> possible). Ideally each patch should introduce one conceptual unit. Of
> course different people might draw the line of "conceptual unit"
> differently, but try to do it so that each one becomes 100-300 lines
> of code :)

Yes, please let me take care of the first few rounds of reviews. I
don't know how much this patch can be split though, as it is supposed
to be the "basic" stuff for PMU. :)

Anyway, will come again later today with a thorough review.
