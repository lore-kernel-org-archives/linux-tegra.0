From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] ARM: tegra: remove copy-and-pasted i2c platform
 data in boards
Date: Mon, 11 Jul 2011 08:02:39 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049E834150@HQMAIL01.nvidia.com>
References: <1310336374-31727-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1310336374-31727-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Colin Cross wrote at Sunday, July 10, 2011 4:20 PM:
> Every board file includes the same platform data definition
> for the i2c-tegra driver's bus speed.  Move the platform data
> into devices.c, and remove it from all the board files.

For both these patches, it seems like pure luck that all current board
happen to share the same platform data.

Given that they do, the change seems conceptually fine, but I wouldn't
necessarily expect any future boards to be able to share the data, and
so this change would make any differing future boards work differently
to all the existing boards...

I guess the idea is that by the time any new boards come along, Device
Tree will be fleshed out enough that we wouldn't need to add code for
the new boards, but just a Device Tree file, so my point isn't an issue?

-- 
nvpublic
