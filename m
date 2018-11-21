From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH] soc/tegra: refactor soc_is_tegra()
Date: Wed, 21 Nov 2018 22:57:52 +0800
Message-ID: <CAEExFWv9YvurGR3iXie-LyHjAyWtmSQgJhmd9=WTd41R4bDiqQ@mail.gmail.com>
References: <20181121141204.22819-1-tiny.windzz@gmail.com> <2d534bbb-7b75-8521-bf88-36b52c918d19@nvidia.com>
 <20181121144320.GA6446@ulmo> <CAEExFWswqoObtnjezRf-3u1ssJ04cwDaggg_HLXju72mannZ6w@mail.gmail.com>
 <bb47ae0d-3607-f396-b9e4-77e25777d6c2@nvidia.com> <20181121145600.GA7739@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121145600.GA7739@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 21, 2018 at 10:56 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Wed, Nov 21, 2018 at 02:50:54PM +0000, Jon Hunter wrote:
> >
> > On 21/11/2018 14:47, Frank Lee wrote:
> > > On Wed, Nov 21, 2018 at 10:43 PM Thierry Reding
> > > <thierry.reding@gmail.com> wrote:
> > >>
> > >> On Wed, Nov 21, 2018 at 02:34:57PM +0000, Jon Hunter wrote:
> > >>>
> > >>> On 21/11/2018 14:12, Yangtao Li wrote:
> > >>>> of_find_node_by_path() acquires a reference to the node returned b=
y
> > >>>> it and that reference needs to be dropped by its caller.soc_is_teg=
ra()
> > >>>> doesn't do that, so fix it.Call of_machine_is_compatible() to refa=
ctor
> > >>>> soc_is_tegra() whcih automatically manages the reference count.
> > >>>>
> > >>>> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > >>>> ---
> > >>>>  drivers/soc/tegra/common.c | 12 +++++++-----
> > >>>>  1 file changed, 7 insertions(+), 5 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common=
.c
> > >>>> index cd8f41351add..0b40700b672a 100644
> > >>>> --- a/drivers/soc/tegra/common.c
> > >>>> +++ b/drivers/soc/tegra/common.c
> > >>>> @@ -22,11 +22,13 @@ static const struct of_device_id tegra_machine=
_match[] =3D {
> > >>>>
> > >>>>  bool soc_is_tegra(void)
> > >>>>  {
> > >>>> -   struct device_node *root;
> > >>>> +   struct of_device_id *match =3D tegra_machine_match;
> > >>>>
> > >>>> -   root =3D of_find_node_by_path("/");
> > >>>> -   if (!root)
> > >>>> -           return false;
> > >>>> +   while(match->compatible){
> > >>>> +           if(of_machine_is_compatible(match->compatible))
> > >>>> +                   return true;
> > >>>> +           match++;
> > >>>> +   }
> > >>>>
> > >>>> -   return of_match_node(tegra_machine_match, root) !=3D NULL;
> > >>>> +   return false;
> > >>>>  }
> > >>>
> > >>> Ugh ... sorry, I thought that of_machine_is_compatible() looped thr=
ough
> > >>> the matches. OK, let's stick with your initial fix.
> > >>
> > >> Actually I prefer this one. Even if it is slightly more verbose, I t=
hink
> > >> it's much clearer what's actually going on. Also this hides all of t=
he
> > >> OF node reference counting in a core function, so it's worth the ext=
ra
> > >> line, in my opinion.
> > >>
> > >> Thierry
> > > Hi Jon=EF=BC=9A
> > >
> > > I like both, how aboout you?
> >
> > Yes fine with me too. However, looks like there is some formatting that
> > needs to be fixed up above. Please make sure you run checkpatch.pl on
> > your patches. Otherwise ...
> >
> > Acked-by: Jon Hunter <jonathanh@nvidia.com>
> >
> > Thierry, pick up this version if you prefer.
>
> Yeah, I noticed the formatting issues, but I can take care of them while
> applying.
>
> Thanks,
> Thierry
Thierry=EF=BC=8C

Thanks.  :-)

Yours,
    Yangtao
