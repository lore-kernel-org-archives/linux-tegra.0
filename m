From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
Date: Tue, 30 Jun 2020 13:26:16 +0300
Message-ID: <3b058989-a93a-6796-8d94-f60ce39e3fba@kapsi.fi>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
 <f1a88006-ab3e-9068-e220-15eee17aeba0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f1a88006-ab3e-9068-e220-15eee17aeba0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 6/29/20 10:42 PM, Dmitry Osipenko wrote:
> 
> Secondly, I suppose neither GPU, nor DLA could wait on a host1x sync
> point, correct? Or are they integrated with Host1x HW?
> 

They can access syncpoints directly. (That's what I alluded to in the 
"Introduction to the hardware" section :) all those things have hardware 
access to syncpoints)

 >
 > .. rest ..
 >

Let me try to summarize once more for my own understanding:

* When submitting a job, you would allocate new syncpoints for the job
* After submitting the job, those syncpoints are not usable anymore
* Postfences of that job would keep references to those syncpoints so 
they aren't freed and cleared before the fences have been released
* Once postfences have been released, syncpoints would be returned to 
the pool and reset to zero

The advantage of this would be that at any point in time, there would be 
a 1:1 correspondence between allocated syncpoints and jobs; so you could 
  shuffle the jobs around channels or reorder them.

Please correct if I got that wrong :)

---

I have two concerns:

* A lot of churn on syncpoints - any time you submit a job you might not 
get a syncpoint for an indefinite time. If we allocate syncpoints 
up-front at least you know beforehand, and then you have the syncpoint 
as long as you need it.
* Plumbing the dma-fence/sync_file everywhere, and keeping it alive 
until waits on it have completed, is more work than just having the 
ID/threshold. This is probably mainly a problem for downstream, where 
updating code for this would be difficult. I know that's not a proper 
argument but I hope we can reach something that works for both worlds.

Here's a proposal in between:

* Keep syncpoint allocation and submission in jobs as in my original 
proposal
* Don't attempt to recover user channel contexts. What this means:
   * If we have a hardware channel per context (MLOCKing), just tear 
down the channel
   * Otherwise, we can just remove (either by patching or by full 
teardown/resubmit of the channel) all jobs submitted by the user channel 
context that submitted the hanging job. Jobs of other contexts would be 
undisturbed (though potentially delayed, which could be taken into 
account and timeouts adjusted)
* If this happens, we can set removed jobs' post-fences to error status 
and user will have to resubmit them.
* We should be able to keep the syncpoint refcounting based on fences.

This can be made more fine-grained by not caring about the user channel 
context, but tearing down all jobs with the same syncpoint. I think the 
result would be that we can get either what you described (or how I 
understood it in the summary in the beginning of the message), or a more 
traditional syncpoint-per-userctx workflow, depending on how the 
userspace decides to allocate syncpoints.

If needed, the kernel can still do e.g. reordering (you mentioned job 
priorities) at syncpoint granularity, which, if the userspace followed 
the model you described, would be the same thing as job granularity.

(Maybe it would be more difficult with current drm_scheduler, sorry, 
haven't had the time yet to read up on that. Dealing with clearing work 
stuff up before summer vacation)

Mikko
