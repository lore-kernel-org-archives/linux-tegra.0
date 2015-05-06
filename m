From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 00/20] Tegra210 Clock Support
Date: Wed, 6 May 2015 12:10:31 -0400
Message-ID: <554A3CF7.6070503@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com> <20150505131419.GA11535@ulmo.nvidia.com> <5548E7E9.3040802@nvidia.com> <20150506133748.GD9421@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150506133748.GD9421@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/6/2015 9:37 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, May 05, 2015 at 11:55:21AM -0400, Rhyland Klein wrote:
>> On 5/5/2015 9:14 AM, Thierry Reding wrote:
>>>> Old Signed by an unknown key
>>>
>>> On Mon, May 04, 2015 at 12:37:20PM -0400, Rhyland Klein wrote:
>>>> This patch series updates the tegra common clock driver and adds
>>>> support for the Tegra210 clocks. The clocks in Tegra210 changed
>>>> significantly in some ways from earlier generations, so to support
>>>> them, we need to extend our base framework a bit and add some new
>>>> features.
>>>>
>>>> Some patches here also address issues found while adding features
>>>> and other cleanup type work.
>>>>
>>>> v4:
>>>>   - Fixed minor checkpatch errors and other typos
>>>>   - Rebased ontop of linux-next 20150504
>>>
>>> Are you sure about this? It still doesn't apply cleanly to next-20150504
>>> for me.
>>
>> It is based off c9256b89d92154cffd36697b412d0a0176a8e2d2 "Add linux-next
>> specific files for 20150504"
>>
>> What types of problems are you running into?
> 
> I get this when applying the first patch:
> 
> 	Applying: clk: tegra: Modify tegra_audio_clk_init to accept more plls
> 	error: patch failed: drivers/clk/tegra/clk.h:258
> 	error: drivers/clk/tegra/clk.h: patch does not apply
> 	Patch failed at 0001 clk: tegra: Modify tegra_audio_clk_init to accept more plls
> 	The copy of the patch that failed is found in:
> 	   /home/thierry.reding/src/kernel/linux-work.git/.git/rebase-apply/patch
> 	When you have resolved this problem, run "git am --continue".
> 	If you prefer to skip this patch, run "git am --skip" instead.
> 	To restore the original branch and stop patching, run "git am --abort".
> 
> Comparing again and looking at your internal tree it seems that in
> addition to next-20150504 you also have this patch in your tree:
> 
> 	clk: tegra: Fix comments for structure definitions
> 
> After applying that I can apply the series without problems. I've picked
> that patch up and will carry it in the Tegra clock branch. Hopefully the
> Tegra210 clock patches will be ready in time for v4.2 so that I can take
> them into the same branch.
> 
> Thierry

Ahh yes. I sent that patch a while back and Peter added his ack, but it
isn't present in linux-next, and I had it in my tree. Sorry for the
confusion.

-rhyland

> 
> * Unknown Key
> * 0x7F3EB3A1
> 


-- 
nvpublic
