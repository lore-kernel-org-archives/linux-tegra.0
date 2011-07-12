From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: remove copy-and-pasted i2c platform data
 in boards
Date: Mon, 11 Jul 2011 21:02:41 -0700
Message-ID: <CAMbhsRQqv23cWBOCxhtA+U=tYxnGka_zNHHGLJbg3766ZYnD+A@mail.gmail.com>
References: <1310336374-31727-1-git-send-email-ccross@android.com>
	<74CDBE0F657A3D45AFBB94109FB122FF049E834150@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049E834150-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 11, 2011 at 8:02 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Colin Cross wrote at Sunday, July 10, 2011 4:20 PM:
>> Every board file includes the same platform data definition
>> for the i2c-tegra driver's bus speed. =A0Move the platform data
>> into devices.c, and remove it from all the board files.
>
> For both these patches, it seems like pure luck that all current boar=
d
> happen to share the same platform data.

Partially luck, partially that every board here is based on nVidia's
reference designs.

> Given that they do, the change seems conceptually fine, but I wouldn'=
t
> necessarily expect any future boards to be able to share the data, an=
d
> so this change would make any differing future boards work differentl=
y
> to all the existing boards...
>
> I guess the idea is that by the time any new boards come along, Devic=
e
> Tree will be fleshed out enough that we wouldn't need to add code for
> the new boards, but just a Device Tree file, so my point isn't an iss=
ue?

Either device tree will solve all the world's problems, or I'll add a
function to initialize the device that takes whatever data needs to be
customized.  That can be solved if it ever becomes necessary.

Any other comments or testers?  Otherwise, I'll try to get this in the
arm-soc tree.
