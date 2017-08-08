From: Joe Kniss <djmk-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Intel-gfx] [PATCH libdrm] drm: Remove create_handle()
 drm_framebuffer "virtual".
Date: Tue, 8 Aug 2017 16:53:45 -0700
Message-ID: <CAOvnNvbEdMA-8bGiZquYEoLGUPTc083-EbUn6UpAZvd7khGixw@mail.gmail.com>
References: <20170808234237.62051-1-djmk@google.com>
 <CAPM=9tzQuont4B9ybMXEDpqP583V_G64ypCR4E+zGvxLGdTULw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0183168959=="
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9tzQuont4B9ybMXEDpqP583V_G64ypCR4E+zGvxLGdTULw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Edward O'Callaghan <funfunctor-dczkZgxz+BNUPWh3PAxdjQ@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:VIRTIO CORE,
 NET..." <virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Vetter, Daniel" <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Alex Xie <AlexBin.Xie-5C7GfCeVMHo@public.gmane.org>, "StDenis, Tom" <tom.stdenis-5C7GfCeVMHo@public.gmane.org>, zhoucm1 <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, "open list:ARM/Rockchip SoC..." <linux-rockchip@list>
List-Id: linux-tegra@vger.kernel.org

--===============0183168959==
Content-Type: multipart/alternative; boundary="001a113cdeaa859de8055646ac90"

--001a113cdeaa859de8055646ac90
Content-Type: text/plain; charset="UTF-8"

I didn't mean to add libdrm, sorry, there is a separate change for that.
I'll double check and test the drivers that don't implement the virtual.

Thanks for the quick reply!

-j

On Tue, Aug 8, 2017 at 4:50 PM, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 9 August 2017 at 09:42, Joe Kniss <djmk-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > Because all drivers currently use gem objects for framebuffer planes,
> > the virtual create_handle() is not required.  This change adds a
> > struct drm_gem_object *gems[4] field to drm_framebuffer and removes
> > create_handle() function pointer from drm_framebuffer_funcs.  The
> > corresponding *_create_handle() function is removed from each driver.
> >
> > In many cases this change eliminates a struct *_framebuffer object,
> > as the only need for the derived struct is the addition of the gem
> > object pointer.
>
> Why the libdrm in the tag? this isn't for libdrm.
>
> This will break drivers that don't current implement the virtual at all.
>
> I think vwmgfx.
>
> The current code checks if the virtual is there before callng it, this code
> just calls the gem code always.
>
> Dave.
>



-- 
Dr. Joe Michael Kniss |  Google ChromeOS |  djmk-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org   |
1-801-898-7977

--001a113cdeaa859de8055646ac90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I didn&#39;t mean to add libdrm, sorry, there is a separat=
e change for that.=C2=A0 I&#39;ll double check and test the drivers that do=
n&#39;t implement the virtual. =C2=A0<div><br></div><div>Thanks for the qui=
ck reply!</div><div><br></div><div>-j</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Tue, Aug 8, 2017 at 4:50 PM, Dave Airlie=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blan=
k">airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span class=3D"">On 9 August 2017 at 09:42, Joe Kniss &lt;<a href=3D"mail=
to:djmk-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org">djmk-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org</a>&gt; wrote:<br>
&gt; Because all drivers currently use gem objects for framebuffer planes,<=
br>
&gt; the virtual create_handle() is not required.=C2=A0 This change adds a<=
br>
&gt; struct drm_gem_object *gems[4] field to drm_framebuffer and removes<br=
>
&gt; create_handle() function pointer from drm_framebuffer_funcs.=C2=A0 The=
<br>
&gt; corresponding *_create_handle() function is removed from each driver.<=
br>
&gt;<br>
&gt; In many cases this change eliminates a struct *_framebuffer object,<br=
>
&gt; as the only need for the derived struct is the addition of the gem<br>
&gt; object pointer.<br>
<br>
</span>Why the libdrm in the tag? this isn&#39;t for libdrm.<br>
<br>
This will break drivers that don&#39;t current implement the virtual at all=
.<br>
<br>
I think vwmgfx.<br>
<br>
The current code checks if the virtual is there before callng it, this code=
<br>
just calls the gem code always.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Dave.<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr"><table cellspacing=3D"0" cellpadding=3D"0" =
style=3D"text-align:center;color:rgb(80,0,80);font-family:&#39;Times New Ro=
man&#39;"><tbody><tr style=3D"color:rgb(85,85,85);font-family:sans-serif;fo=
nt-size:small"><td nowrap style=3D"border-top-style:solid;border-top-color:=
rgb(213,15,37);border-top-width:2px"><font size=3D"1"><font face=3D"garamon=
d, serif">Dr. Joe Michael Kniss </font>|</font></td><td nowrap style=3D"bor=
der-top-style:solid;border-top-color:rgb(51,105,232);border-top-width:2px">=
<font size=3D"1">=C2=A0<font face=3D"garamond, serif"><font color=3D"#0b539=
4">G</font><font color=3D"#cc0000">o</font><font color=3D"#bf9000">o</font>=
<font color=3D"#0b5394">g</font><font color=3D"#38761d">l</font><font color=
=3D"#cc0000">e</font><font color=3D"#000000">=C2=A0</font><font color=3D"#4=
44444">ChromeOS</font></font><font color=3D"#000000">=C2=A0</font>|</font><=
/td><td nowrap style=3D"border-top-style:solid;border-top-color:rgb(0,153,5=
7);border-top-width:2px"><font size=3D"1"><font face=3D"garamond, serif">=
=C2=A0<a href=3D"mailto:djmk-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" target=3D"_blank">djmk<font color=
=3D"#1155cc">@google.com</font></a>=C2=A0</font>=C2=A0</font></td><td nowra=
p style=3D"border-top-style:solid;border-top-color:rgb(238,178,17);border-t=
op-width:2px"><font size=3D"1"><a value=3D"+16504298119" style=3D"color:rgb=
(17,85,204)">| </a><font face=3D"garamond, serif"><font color=3D"#1155cc">1=
-801-898-7977</font><br></font></font></td></tr></tbody></table></div></div=
></div></div>
</div>

--001a113cdeaa859de8055646ac90--

--===============0183168959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==

--===============0183168959==--
