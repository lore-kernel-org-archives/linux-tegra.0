From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
Date: Thu, 30 Jan 2020 09:20:38 -0800
Message-ID: <845c362b-e164-58eb-118c-e779be8dd4e2@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a6512e1b-ad0e-3f59-e775-418db4865994-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I noticed the warning in queue_setup and will be removed in v2.

But errors are related to not using latest host1x driver. latest host1x=20
driver changed parent member to host.

So vi/csi driver also uses new member name host. Probably media_tree=20
don't have latest host1x driver


On 1/30/20 6:41 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sowjanya,
>
> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>> generator (TPG) capture.
>>
>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>> CSI port is one-to-one mapped to VI channel for video capture.
>>
>> This series has TPG support only where it creates hard media links
>> between CSI subdevice and VI video device without device graphs.
>>
>> v4l2-compliance results are available below the patch diff.
>>
>> [v0]: Includes,
>>        - Adds CSI TPG clock to Tegra210 clock driver
>>        - Host1x video driver with VI and CSI clients.
>>        - Support for Tegra210 only.
>>        - VI CSI TPG support with hard media links in driver.
>>        - Video formats supported by Tegra210 VI
>>        - CSI TPG supported video formats
> I'm trying to compile this patch series using the media_tree master
> branch (https://git.linuxtv.org//media_tree.git), but it fails:
>
> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98tegra_c=
hannel_queue_setup=E2=80=99:
> drivers/staging/media/tegra/tegra-channel.c:71:15: warning: unused variab=
le =E2=80=98count=E2=80=99 [-Wunused-variable]
>     71 |  unsigned int count =3D *nbuffers;
>        |               ^~~~~
> drivers/staging/media/tegra/tegra-channel.c: In function =E2=80=98tegra_c=
hannel_init=E2=80=99:
> drivers/staging/media/tegra/tegra-channel.c:518:55: error: =E2=80=98struc=
t host1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    518 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
>        |                                                       ^
> make[4]: *** [scripts/Makefile.build:265: drivers/staging/media/tegra/teg=
ra-channel.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_tpg=
_graph_init=E2=80=99:
> drivers/staging/media/tegra/tegra-vi.c:157:55: error: =E2=80=98struct hos=
t1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    157 |  struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
>        |                                                       ^
> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_ini=
t=E2=80=99:
> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_csi_i=
nit=E2=80=99:
> drivers/staging/media/tegra/tegra-vi.c:213:51: error: =E2=80=98struct hos=
t1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    213 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>        |                                                   ^~
> drivers/staging/media/tegra/tegra-csi.c:259:51: error: =E2=80=98struct ho=
st1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    259 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>        |                                                   ^~
> drivers/staging/media/tegra/tegra-vi.c: In function =E2=80=98tegra_vi_exi=
t=E2=80=99:
> drivers/staging/media/tegra/tegra-vi.c:246:51: error: =E2=80=98struct hos=
t1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    246 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>        |                                                   ^~
> drivers/staging/media/tegra/tegra-csi.c: In function =E2=80=98tegra_csi_e=
xit=E2=80=99:
> drivers/staging/media/tegra/tegra-csi.c:286:51: error: =E2=80=98struct ho=
st1x_client=E2=80=99 has no member named =E2=80=98host=E2=80=99
>    286 |  struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>        |                                                   ^~
>
> And indeed, struct host1x_client as defined in include/linux/host1x.h doe=
sn't
> have a 'host' field.
>
> Does this series depend on another patch that's not yet in mainline?
>
> Regards,
>
>          Hans
