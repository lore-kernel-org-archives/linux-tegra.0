From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Subject: Re: [PATCH V3] get_maintainer: use filename-only regex match for Tegra
Date: Mon, 11 Mar 2013 22:36:48 +0100
Message-ID: <CA+GA0_sCXOScRTJMiuz1NkP6uGaB6kkVD4qG+WaOFRyAB-r2NA@mail.gmail.com>
References: <1363033149-7839-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0605623405=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1363033149-7839-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-tegra@vger.kernel.org

--===============0605623405==
Content-Type: multipart/alternative; boundary=e89a8f3bb06766cdaf04d7acf834

--e89a8f3bb06766cdaf04d7acf834
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

11 mar 2013 21:19, "Stephen Warren" <swarren@wwwdotorg.org> napisa=C5=82(a)=
:
>
> From: Stephen Warren <swarren@nvidia.com>
>
> Create a new N: entry type in MAINTAINERS which performs a regex match
> against filenames; either those extracted from patch +++ or --- lines,
> or those specified on the command-line using the -f option.
>
> This provides the same benefits as using a K: regex option to match a
> set of filenames (see commit eb90d08 "get_maintainer: allow keywords to
> match filenames"), but without the disadvantage that "random" file
> content, such as comments, will ever match the regex. Hence, revert most
> of that commit.
>
> Switch the Tegra entry from using K: to N:
>
> Reported-by: Marcin Slusarz <marcin.slusarz@gmail.com>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v2: Corrected typo in MAINTAINERS documentation
> v3: Squash 3 patches into one.
> ---
>  MAINTAINERS               |   14 ++++++++------
>  scripts/get_maintainer.pl |    2 +-
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9561658..e68a07a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -90,6 +90,9 @@ Descriptions of section entries:
>            F:   drivers/net/*   all files in drivers/net, but not below
>            F:   */net/*         all files in "any top level directory"/ne=
t
>            One pattern per line.  Multiple F: lines acceptable.
> +       N: Files and directories with regex patterns.
> +          N:   [^a-z]tegra     all files whose patch contains the word
tegra

s/patch/path/ ?

> +          One pattern per line.  Multiple N: lines acceptable.
>         X: Files and directories that are NOT maintained, same rules as F=
:
>            Files exclusions are tested before file matches.
>            Can be useful for excluding a specific subdirectory, for
instance:
> @@ -97,13 +100,12 @@ Descriptions of section entries:
>            X:   net/ipv6/
>            matches all files in and below net excluding net/ipv6/
>         K: Keyword perl extended regex pattern to match content in a
> -          patch or file, or an affected filename.  For instance:
> +          patch or file.  For instance:
>            K: of_get_profile
> -             matches patch or file content, or filenames, that contain
> -             "of_get_profile"
> +             matches patches or files that contain "of_get_profile"
>            K: \b(printk|pr_(info|err))\b
> -             matches patch or file content, or filenames, that contain
one or
> -             more of the words printk, pr_info or pr_err
> +             matches patches or files that contain one or more of the
words
> +             printk, pr_info or pr_err
>            One regex pattern per line.  Multiple K: lines acceptable.
>
>  Note: For the hard of thinking, this list is meant to remain in
alphabetical
> @@ -7848,7 +7850,7 @@ L:        linux-tegra@vger.kernel.org
>  Q:     http://patchwork.ozlabs.org/project/linux-tegra/list/
>  T:     git git://
git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
>  S:     Supported
> -K:     (?i)[^a-z]tegra
> +N:     [^a-z]tegra
>
>  TEHUTI ETHERNET DRIVER
>  M:     Andy Gospodarek <andy@greyhouse.net>
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index ce4cc83..5e4fb14 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -611,7 +611,7 @@ sub get_maintainers {
>                                     $hash{$tvi} =3D $value_pd;
>                                 }
>                             }
> -                       } elsif ($type eq 'K') {
> +                       } elsif ($type eq 'N') {
>                             if ($file =3D~ m/$value/x) {
>                                 $hash{$tvi} =3D 0;
>                             }
> --
> 1.7.10.4
>

--e89a8f3bb06766cdaf04d7acf834
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p><br>
11 mar 2013 21:19, &quot;Stephen Warren&quot; &lt;<a href=3D"mailto:swarren=
@wwwdotorg.org">swarren@wwwdotorg.org</a>&gt; napisa=C5=82(a):<br>
&gt;<br>
&gt; From: Stephen Warren &lt;<a href=3D"mailto:swarren@nvidia.com">swarren=
@nvidia.com</a>&gt;<br>
&gt;<br>
&gt; Create a new N: entry type in MAINTAINERS which performs a regex match=
<br>
&gt; against filenames; either those extracted from patch +++ or --- lines,=
<br>
&gt; or those specified on the command-line using the -f option.<br>
&gt;<br>
&gt; This provides the same benefits as using a K: regex option to match a<=
br>
&gt; set of filenames (see commit eb90d08 &quot;get_maintainer: allow keywo=
rds to<br>
&gt; match filenames&quot;), but without the disadvantage that &quot;random=
&quot; file<br>
&gt; content, such as comments, will ever match the regex. Hence, revert mo=
st<br>
&gt; of that commit.<br>
&gt;<br>
&gt; Switch the Tegra entry from using K: to N:<br>
&gt;<br>
&gt; Reported-by: Marcin Slusarz &lt;<a href=3D"mailto:marcin.slusarz@gmail=
.com">marcin.slusarz@gmail.com</a>&gt;<br>
&gt; Suggested-by: Joe Perches &lt;<a href=3D"mailto:joe@perches.com">joe@p=
erches.com</a>&gt;<br>
&gt; Signed-off-by: Stephen Warren &lt;<a href=3D"mailto:swarren@nvidia.com=
">swarren@nvidia.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Corrected typo in MAINTAINERS documentation<br>
&gt; v3: Squash 3 patches into one.<br>
&gt; ---<br>
&gt; =C2=A0MAINTAINERS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 14 ++++++++------<br>
&gt; =C2=A0scripts/<a href=3D"http://get_maintainer.pl">get_maintainer.pl</=
a> | =C2=A0 =C2=A02 +-<br>
&gt; =C2=A02 files changed, 9 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 9561658..e68a07a 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -90,6 +90,9 @@ Descriptions of section entries:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F: =C2=A0 drivers/net/* =C2=
=A0 all files in drivers/net, but not below<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F: =C2=A0 */net/* =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 all files in &quot;any top level directory&quot;/net<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0One pattern per line. =C2=A0M=
ultiple F: lines acceptable.<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 N: Files and directories with regex patterns.<b=
r>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0N: =C2=A0 [^a-z]tegra =C2=A0 =C2=
=A0 all files whose patch contains the word tegra</p>
<p>s/patch/path/ ?</p>
<p>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0One pattern per line. =C2=A0Mul=
tiple N: lines acceptable.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 X: Files and directories that are NOT main=
tained, same rules as F:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Files exclusions are tested b=
efore file matches.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Can be useful for excluding a=
 specific subdirectory, for instance:<br>
&gt; @@ -97,13 +100,12 @@ Descriptions of section entries:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0X: =C2=A0 net/ipv6/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0matches all files in and belo=
w net excluding net/ipv6/<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 K: Keyword perl extended regex pattern to =
match content in a<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patch or file, or an affected file=
name. =C2=A0For instance:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patch or file. =C2=A0For instance:=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0K: of_get_profile<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 matches patch or file cont=
ent, or filenames, that contain<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;of_get_profile&quot;=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 matches patches or files t=
hat contain &quot;of_get_profile&quot;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0K: \b(printk|pr_(info|err))\b=
<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 matches patch or file cont=
ent, or filenames, that contain one or<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 more of the words printk, =
pr_info or pr_err<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 matches patches or files t=
hat contain one or more of the words<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk, pr_info or pr_err<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0One regex pattern per line. =
=C2=A0Multiple K: lines acceptable.<br>
&gt;<br>
&gt; =C2=A0Note: For the hard of thinking, this list is meant to remain in =
alphabetical<br>
&gt; @@ -7848,7 +7850,7 @@ L: =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:=
linux-tegra@vger.kernel.org">linux-tegra@vger.kernel.org</a><br>
&gt; =C2=A0Q: =C2=A0 =C2=A0 <a href=3D"http://patchwork.ozlabs.org/project/=
linux-tegra/list/">http://patchwork.ozlabs.org/project/linux-tegra/list/</a=
><br>
&gt; =C2=A0T: =C2=A0 =C2=A0 git git://<a href=3D"http://git.kernel.org/pub/=
scm/linux/kernel/git/swarren/linux-tegra.git">git.kernel.org/pub/scm/linux/=
kernel/git/swarren/linux-tegra.git</a><br>
&gt; =C2=A0S: =C2=A0 =C2=A0 Supported<br>
&gt; -K: =C2=A0 =C2=A0 (?i)[^a-z]tegra<br>
&gt; +N: =C2=A0 =C2=A0 [^a-z]tegra<br>
&gt;<br>
&gt; =C2=A0TEHUTI ETHERNET DRIVER<br>
&gt; =C2=A0M: =C2=A0 =C2=A0 Andy Gospodarek &lt;<a href=3D"mailto:andy@grey=
house.net">andy@greyhouse.net</a>&gt;<br>
&gt; diff --git a/scripts/<a href=3D"http://get_maintainer.pl">get_maintain=
er.pl</a> b/scripts/<a href=3D"http://get_maintainer.pl">get_maintainer.pl<=
/a><br>
&gt; index ce4cc83..5e4fb14 100755<br>
&gt; --- a/scripts/<a href=3D"http://get_maintainer.pl">get_maintainer.pl</=
a><br>
&gt; +++ b/scripts/<a href=3D"http://get_maintainer.pl">get_maintainer.pl</=
a><br>
&gt; @@ -611,7 +611,7 @@ sub get_maintainers {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $hash{$tvi} =3D $va=
lue_pd;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } elsif ($type eq &#39;K&#39;) {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } elsif ($type eq &#39;N&#39;) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($file =3D~ m/$value/x) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $hash{$tvi} =3D 0;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
</p>

--e89a8f3bb06766cdaf04d7acf834--

--===============0605623405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0605623405==--
