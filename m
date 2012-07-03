From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: tegra: Add clk_tegra structure and helper functions
Date: Mon, 02 Jul 2012 19:31:05 -0600
Message-ID: <4FF24B59.1060508@wwwdotorg.org>
References: <1340879846-12900-1-git-send-email-pgaikwad@nvidia.com> <1340879846-12900-5-git-send-email-pgaikwad@nvidia.com> <20120628182759.GA28424@gmail.com> <4FED688E.9090408@nvidia.com> <CAJOA=zMt-HWKrgQ-pD-wH0s_Nao5sJA13+ESJSBkHQ_3OBurtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJOA=zMt-HWKrgQ-pD-wH0s_Nao5sJA13+ESJSBkHQ_3OBurtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Turquette, Mike" <mturquette-l0cyMroinI0@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/02/2012 06:09 PM, Turquette, Mike wrote:
> On Fri, Jun 29, 2012 at 1:34 AM, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On Thursday 28 June 2012 11:58 PM, Mike Turquette wrote:
>>> We had some discussions in the past on your clock reset and external
>>> line request operations which you've had to put into struct clk_tegra.
>>>
>>> Do you need to expose those ops to code in drivers/*?  I consider that a
>>> reasonable litmus test to start considering if something should be moved
>>> into the generic clk.h api.
>>
>>
>> Yes, we need these ops in drivers. Peter has sent a patch proposing to move
>> these ops to generic clk.
>>
>> In addition, we also need mechanism/ops to change rate and parent from
>> clk_ops implementation. There was some discussion but I do not know the
>> latest status.
>>
> 
> Hi Prashant,
> 
> OK, that is good to know.  I haven't forgotten about this topic.  I'm
> still trying to think of the best way to expose less-common operations
> to drivers...
> 
> Based on Stephen's feedback in patch 0 I'll be waiting for another
> version of this series before taking into clk-next.

Oh, does this series depend on stuff in clk-next? I was intending to
take it through the Tegra tree, since it definitely depends on (in
complex ways through context if nothing else due to to large
split/rename patches) a bunch of commits in Tegra's for-3.6/common-clk
branch.
