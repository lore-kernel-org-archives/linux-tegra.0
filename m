From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [PATCH 4/6] ARM: tegra: Add clk_tegra structure and helper functions
Date: Mon, 2 Jul 2012 18:49:27 -0700
Message-ID: <CAJOA=zMEb49YOrz2ZdSL31tHCSROF3J6Gz4ZHYeik82RnWVfLg@mail.gmail.com>
References: <1340879846-12900-1-git-send-email-pgaikwad@nvidia.com>
 <1340879846-12900-5-git-send-email-pgaikwad@nvidia.com> <20120628182759.GA28424@gmail.com>
 <4FED688E.9090408@nvidia.com> <CAJOA=zMt-HWKrgQ-pD-wH0s_Nao5sJA13+ESJSBkHQ_3OBurtg@mail.gmail.com>
 <4FF24B59.1060508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FF24B59.1060508@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "ccross@android.com" <ccross@android.com>, "olof@lixom.net" <olof@lixom.net>, Peter De Schrijver <pdeschrijver@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 2, 2012 at 6:31 PM, Stephen Warren <swarren@wwwdotorg.org> =
wrote:
> On 07/02/2012 06:09 PM, Turquette, Mike wrote:
>> On Fri, Jun 29, 2012 at 1:34 AM, Prashant Gaikwad <pgaikwad@nvidia.c=
om> wrote:
>>> On Thursday 28 June 2012 11:58 PM, Mike Turquette wrote:
>>>> We had some discussions in the past on your clock reset and extern=
al
>>>> line request operations which you've had to put into struct clk_te=
gra.
>>>>
>>>> Do you need to expose those ops to code in drivers/*? =A0I conside=
r that a
>>>> reasonable litmus test to start considering if something should be=
 moved
>>>> into the generic clk.h api.
>>>
>>>
>>> Yes, we need these ops in drivers. Peter has sent a patch proposing=
 to move
>>> these ops to generic clk.
>>>
>>> In addition, we also need mechanism/ops to change rate and parent f=
rom
>>> clk_ops implementation. There was some discussion but I do not know=
 the
>>> latest status.
>>>
>>
>> Hi Prashant,
>>
>> OK, that is good to know. =A0I haven't forgotten about this topic. =A0=
I'm
>> still trying to think of the best way to expose less-common operatio=
ns
>> to drivers...
>>
>> Based on Stephen's feedback in patch 0 I'll be waiting for another
>> version of this series before taking into clk-next.
>
> Oh, does this series depend on stuff in clk-next? I was intending to
> take it through the Tegra tree, since it definitely depends on (in
> complex ways through context if nothing else due to to large
> split/rename patches) a bunch of commits in Tegra's for-3.6/common-cl=
k
> branch.

Oops.  I just completely zoned out and went into "clk-next maintenance
mode".  Yeah you had already mentioned that this was for the Tegra
tree.

Nothing to see here, move along!

Regards,
Mike
