From: =?ISO-8859-1?Q?St=E9phane_Marchesin?= <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 00/16] drm/nouveau: initial support for GK20A
	(Tegra K1)
Date: Sun, 2 Feb 2014 19:32:12 -0800
Message-ID: <CACP_E+LCV60B=pAGUuv4ZcQ3Q5wLqE3darVWCBEDGW8FqHPFyg@mail.gmail.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
	<CAKb7Uvg4Bqy1tHetVZBe=aekFDbgrGygc-evnSXxsoGqgoTA8A@mail.gmail.com>
	<52EF0294.2090103@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1889166390=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <52EF0294.2090103-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--===============1889166390==
Content-Type: multipart/alternative; boundary=001a11c309eabe8afc04f1782dc2

--001a11c309eabe8afc04f1782dc2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2014 at 6:44 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>wrot=
e:

> On 02/03/2014 04:10 AM, Ilia Mirkin wrote:
>
>> Hi Alexandre,
>>
>> On Fri, Jan 31, 2014 at 10:16 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
>
>> wrote:
>>
>>> I guess my email address might surprise some of you, so let me
>>> anticipate some
>>> questions you might have. :P Yes, this work is endorsed by NVIDIA.
>>> Several other
>>> NVIDIAns (CC'd), including core GPU experts, have provided significant
>>> technical
>>> guidance and will continue their involvement. Special thanks go to Terj=
e
>>> Bergstrom and Ken Adams for their invaluable GPU expertise, and Thierry
>>> Reding
>>> (at FOSDEM this weekend) for help with debugging and user-space testing=
.
>>>
>>> Let me also stress that although very exciting, this effort is still
>>> experimental, so I would like to make sure that nobody makes excessive
>>> expectations based on these few patches. The scope of this work is
>>> strictly
>>> limited to Tegra (although given the similarities desktop GPU support
>>> will
>>> certainly benefit from it indirectly), and we do not have any plan to
>>> work on
>>> user-space support. So do not uninstall that proprietary driver just
>>> yet. ;)
>>>
>>> With this being clarified, we are looking forward to getting your
>>> feedback and
>>> working with you guys to bring and improve Tegra K1 support into
>>> Nouveau! :)
>>>
>>
>> I've sent a couple of fairly trivial comments, as you saw, and I
>> suspect that others with a better understanding of the guts will have
>> more substantial architectural feedback, esp after the weekend/FOSDEM.
>> However, since no one's said it already -- welcome to Nouveau!
>>
>
> Thanks! ^_^v
>
> One beginner question: is it appropriate to send kernel patches to the
> nouveau list in addition to dri-devel? The moderation messages I receive
> make me think that this list might rather be intended for general
> discussion.


The moderation was because there are too many CCs: on this thread. A couple
of those could probably be dropped. In any case, I've increased the max.

St=E9phane


>
>
>   From the looks of it, you could bring up a full open-source stack with
>> your patches (i.e. Xorg + nouveau DDX + mesa) and use PRIME to render
>> stuff (assuming the actual display hw has an X ddx).  Although I
>> suspect that you're going to want to use your own drivers. Still a
>> little curious if you've tried the open-source stack and whether it
>> worked. [Not sure what the status is of render-node support is in
>> mesa, but perhaps it's enough to try running piglit tests, if you
>> can't get X going with the display HW.]
>>
>
> We are still testing things at libdrm level, but are eventually intereste=
d
> in bringing up the existing open-source stack. Our guess (and hope) is th=
at
> it will work nicely almost as-is, minus the fact that the display hardwar=
e
> is not handled by Nouveau and we only support render nodes (I have yet to
> look at what the state of render nodes in Mesa is).
>
> For X, Thierry is IIUC working on the display driver, and at some point
> these efforts should join to connect tegradrm and Nouveau using PRIME. We
> are not quite there yet, and since we are working with limited resources =
it
> will likely require some time, but the fact we could bring up a (seemingl=
y)
> working Nouveau kernel driver with so little code is encouraging.
>
> Thanks,
> Alex.
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--001a11c309eabe8afc04f1782dc2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sun, Feb 2, 2014 at 6:44 PM, Alexandre Courbot <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" target=3D"_blank">acourbot@nvid=
ia.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 02/03/2014 04:10 AM, Il=
ia Mirkin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Alexandre,<br>
<br>
On Fri, Jan 31, 2014 at 10:16 PM, Alexandre Courbot &lt;<a href=3D"mailto:a=
courbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" target=3D"_blank">acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt; wrote:<br=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I guess my email address might surprise some of you, so let me anticipate s=
ome<br>
questions you might have. :P Yes, this work is endorsed by NVIDIA. Several =
other<br>
NVIDIAns (CC&#39;d), including core GPU experts, have provided significant =
technical<br>
guidance and will continue their involvement. Special thanks go to Terje<br=
>
Bergstrom and Ken Adams for their invaluable GPU expertise, and Thierry Red=
ing<br>
(at FOSDEM this weekend) for help with debugging and user-space testing.<br=
>
<br>
Let me also stress that although very exciting, this effort is still<br>
experimental, so I would like to make sure that nobody makes excessive<br>
expectations based on these few patches. The scope of this work is strictly=
<br>
limited to Tegra (although given the similarities desktop GPU support will<=
br>
certainly benefit from it indirectly), and we do not have any plan to work =
on<br>
user-space support. So do not uninstall that proprietary driver just yet. ;=
)<br>
<br>
With this being clarified, we are looking forward to getting your feedback =
and<br>
working with you guys to bring and improve Tegra K1 support into Nouveau! :=
)<br>
</blockquote>
<br>
I&#39;ve sent a couple of fairly trivial comments, as you saw, and I<br>
suspect that others with a better understanding of the guts will have<br>
more substantial architectural feedback, esp after the weekend/FOSDEM.<br>
However, since no one&#39;s said it already -- welcome to Nouveau!<br>
</blockquote>
<br></div>
Thanks! ^_^v<br>
<br>
One beginner question: is it appropriate to send kernel patches to the nouv=
eau list in addition to dri-devel? The moderation messages I receive make m=
e think that this list might rather be intended for general discussion.</bl=
ockquote>

<div><br></div><div>The moderation was because there are too many CCs: on t=
his thread. A couple of those could probably be dropped. In any case, I&#39=
;ve increased the max.</div><div><br></div><div>St=E9phane</div><div>=A0</d=
iv>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=A0From the looks of it, you could bring up a full open-source stack with<b=
r>
your patches (i.e. Xorg + nouveau DDX + mesa) and use PRIME to render<br>
stuff (assuming the actual display hw has an X ddx). =A0Although I<br>
suspect that you&#39;re going to want to use your own drivers. Still a<br>
little curious if you&#39;ve tried the open-source stack and whether it<br>
worked. [Not sure what the status is of render-node support is in<br>
mesa, but perhaps it&#39;s enough to try running piglit tests, if you<br>
can&#39;t get X going with the display HW.]<br>
</blockquote>
<br></div>
We are still testing things at libdrm level, but are eventually interested =
in bringing up the existing open-source stack. Our guess (and hope) is that=
 it will work nicely almost as-is, minus the fact that the display hardware=
 is not handled by Nouveau and we only support render nodes (I have yet to =
look at what the state of render nodes in Mesa is).<br>


<br>
For X, Thierry is IIUC working on the display driver, and at some point the=
se efforts should join to connect tegradrm and Nouveau using PRIME. We are =
not quite there yet, and since we are working with limited resources it wil=
l likely require some time, but the fact we could bring up a (seemingly) wo=
rking Nouveau kernel driver with so little code is encouraging.<br>


<br>
Thanks,<br>
Alex.<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
______________________________<u></u>_________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">dri-de=
vel-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org<u></u>org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/<u></u>mailman/listinfo/dri-devel<=
/a><br>
</div></div></blockquote></div><br></div></div>

--001a11c309eabe8afc04f1782dc2--

--===============1889166390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1889166390==--
