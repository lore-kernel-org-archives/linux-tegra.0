From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] tegrarcm: License update for miniloader files
Date: Mon, 17 Jun 2013 20:25:37 -0700
Message-ID: <1371525937-2713-2-git-send-email-amartin@nvidia.com>
References: <1371525937-2713-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371525937-2713-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This changes the license under which the miniloader files are
distributed to the same license used for the binary portions of the
Tegra L4T distribution.  This should hopefully make the license more
palatable to distributions.

Also changed the description to say that the license applies to all
files in the miniloader directory instead of individually listing the
files.  This should hopefully prevent it from becoming stale.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 LICENSE | 284 ++++++++++++++++++++++++++------------------------------=
--------
 1 file changed, 114 insertions(+), 170 deletions(-)

diff --git a/LICENSE b/LICENSE
index e126375..4bd5c60 100644
--- a/LICENSE
+++ b/LICENSE
@@ -26,189 +26,133 @@
 # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
=20
=20
-The files tegra20-miniloader.h and tegra30-miniloader.h are provided
-pursuant to the following license agreement:
+The files in the miniloader directory are provided pursuant to the
+following license agreement:
=20
-License For Use of NVIDIA Software
+           License For Customer Use of NVIDIA Software
=20
=20
-IMPORTANT NOTICE -- READ CAREFULLY: This License For Use of NVIDIA
-Software ("LICENSE") is the agreement which governs use of the
-software (in binary code form only) of NVIDIA Corporation and its
-subsidiaries ("NVIDIA")
-provided herewith by NVIDIA, including computer software and
-associated printed materials (collectively, the "SOFTWARE").  By
-downloading, installing, copying, or otherwise using the SOFTWARE, you
-agree to be bound by the terms of this LICENSE.  If you do not agree
-to the terms of this LICENSE, do not download, install or use the
-SOFTWARE.
+IMPORTANT NOTICE -- READ CAREFULLY: This License For Customer Use of
+NVIDIA Software ("LICENSE") is the agreement which governs use of
+the software of NVIDIA Corporation and its subsidiaries ("NVIDIA")
+downloadable herefrom, including computer software and associated
+printed materials ("SOFTWARE").  By downloading, installing, copying,
+or otherwise using the SOFTWARE, you agree to be bound by the terms
+of this LICENSE.  If you do not agree to the terms of this LICENSE,
+do not download the SOFTWARE.
=20
 RECITALS
=20
-The SOFTWARE is protected by copyright laws and international
-copyright treaties, as well as other intellectual property laws and
-treaties. The SOFTWARE is not sold, and instead is only licensed for
-use, strictly in accordance with this document.  This agreement sets
-forth the terms and conditions of the SOFTWARE LICENSE only.
+Use of NVIDIA's products requires three elements: the SOFTWARE, the
+hardware on a graphics controller board, and a personal computer. The
+SOFTWARE is protected by copyright laws and international copyright
+treaties, as well as other intellectual property laws and treaties.
+The SOFTWARE is not sold, and instead is only licensed for use,
+strictly in accordance with this document.  The hardware is protected
+by various patents, and is sold, but this agreement does not cover
+that sale, since it may not necessarily be sold as a package with
+the SOFTWARE.  This agreement sets forth the terms and conditions
+of the SOFTWARE LICENSE only.
=20
 1.  DEFINITIONS
=20
-1.1  =E2=80=9CLicensee,=E2=80=9D =E2=80=9CYou=E2=80=9D and/or =E2=80=9C=
Your=E2=80=9D shall mean, collectively and
-individually, Original Equipment Manufacturers, Independent Hardware
-Vendors, Independent Software Vendors, and/or End-Users of the
-Software pursuant to the terms and conditions of this LICENSE.
-
-1.2	 Intellectual Property Rights=E2=80=9D shall mean all proprietary
-rights, including all patents, trademarks, copyrights, know-how, trade
-secrets, mask works, including all applications and registrations
-thereto, and any other similar protected rights in any country
+1.1  Customer.  Customer means the entity or individual that
+downloads the SOFTWARE.
=20
 2.  GRANT OF LICENSE
=20
-2.1  Rights and Limitations of Grant.  NVIDIA hereby grants to You the
-following non-exclusive, non-transferable, revocable right under
-NVIDIA=E2=80=99s copyrights to use, copy, distribute and sublicense th=
e
-SOFTWARE (solely in binary code form) to Your sublicensees (a) solely
-for use in connection with NVIDIA hardware or software products; and
-(b) pursuant to the terms and conditions of any form of end-user
-software license agreement; provided, that Your sublicensees agree to
-be bound by this LICENSE or terms and conditions that are as
-protective of NVIDIA=E2=80=99s Intellectual Property Rights in the SOF=
TWARE as
-this LICENSE
-
-2.2  Limitations. You may not reverse engineer, decompile, or
-disassemble the SOFTWARE, nor attempt in any other manner to obtain
-the source code.
-
-Except as expressly permitted in this LICENSE, You shall not otherwise
-assign, sublicense, rent, lease, or in any other way transfer or
-disclose SOFTWARE to any third party. Unless otherwise authorized in
-the LICENSE, You shall not reverse- compile, disassemble,
-reverse-engineer, or in any manner attempt to derive the source code
-of the SOFTWARE.
-
-Except as expressly stated in this LICENSE, no license or right is
-granted to You directly or by implication, inducement, estoppel or
-otherwise. NVIDIA shall have the right to inspect or have an
-independent auditor inspect Your relevant records to verify Your
-compliance with the terms and conditions of this LICENSE.
-
-3.  TERM AND TERMINATION
-
-This LICENSE and the licenses granted hereunder shall be effective as
-of the date You download the applicable SOFTWARE (=E2=80=9CEffective D=
ate=E2=80=9D)
-and continue for a period of one (1) year (=E2=80=9CInitial Term=E2=80=
=9D)
-respectively, unless terminated earlier in accordance with the
-=E2=80=9CTermination=E2=80=9D provision of this LICENSE.  Unless eithe=
r party notifies
-the other party of its intent to terminate this LICENSE at least three
-(3) months prior to the end of the Initial Term or the applicable
-renewal period, this License will be automatically renewed for one (1)
-year renewal periods thereafter, unless terminated in accordance with
-the =E2=80=9CTermination=E2=80=9D provision of this LICENSE
-
-NVIDIA may terminate this LICENSE at any time if You violate its
-terms. Upon termination, You will immediately destroy the SOFTWARE or
-return all copies of the SOFTWARE to NVIDIA, and certify to NVIDIA in
-writing that such actions have been completed.  Upon termination or
-expiration of this LICENSE the license grants to Licensee shall
-terminate, except that sublicenses rightfully granted by Licensee
-under this LICENSE in connection with Paragraph 2 of this LICENSE
-provided by Licensee prior to the termination or expiration of this
-LICENSE shall survive in accordance with their respective form of
-license terms and conditions.
-
-Those provisions in this LICENSE, which by their nature need to
-survive the termination or expiration of this LICENSE, shall survive
-termination or expiration of the LICENSE, including but not limited to
-Paragraphs 1, 2.2, 3, 4, 5, 6, 7, and 8.
-
-If You commence or participate in any legal proceeding against NVIDIA,
-including Intellectual Property Rights infringement claims against
-NVIDIA, then NVIDIA may, in its sole discretion, suspend or terminate
-all license grants and any other rights provided under this LICENSE
-during the pendency of such legal proceedings.
-
-4.  OWNERSHIP OF SOFTWARE AND INTELLECTUAL PROPERTY RIGHTS
-
-All rights, title and interest to all copies of the SOFTWARE remain
-with NVIDIA, subsidiaries, licensors, or its suppliers. The SOFTWARE
-is copyrighted and protected by the laws of the United States and
-other countries, and international treaty provisions. You may not
-remove any copyright notices from the SOFTWARE. NVIDIA may make
-changes to the SOFTWARE, or to items referenced therein, at any time
-and without notice, but is not obligated to support or update the
-SOFTWARE. Except as otherwise expressly provided, NVIDIA grants no
-express or implied right under any NVIDIA patents, copyrights,
-trademarks, or other Intellectual Property Rights.
-
-You have no obligation to give NVIDIA any suggestions, comments or
-other feedback (=E2=80=9CFeedback=E2=80=9D) relating to the SOFTWARE. =
 However, NVIDIA
-may use and include any Feedback that You voluntarily provide to
-improve the SOFTWARE or other related NVIDIA technologies.
-Accordingly, if You provide Feedback, You agree NVIDIA and its
-licensees may freely use, reproduce, license, distribute, and
-otherwise commercialize the Feedback in the SOFTWARE or other related
-technologies without the payment of any royalties or fees.
-
+2.1  Rights and Limitations of Grant.  NVIDIA hereby grants Customer
+the following non-exclusive, non-transferable right to use the
+SOFTWARE, with the following limitations:
+
+2.1.1  Rights.  Customer may install and use one copy of the SOFTWARE
+on a single computer, and except for making one back-up copy of
+the Software, may not otherwise copy the SOFTWARE.  This LICENSE
+of SOFTWARE may not be shared or used concurrently on different
+computers.
+
+2.1.2  Linux/FreeBSD Exception.  Notwithstanding the foregoing terms
+of Section 2.1.1, SOFTWARE designed exclusively for use on the Linux o=
r
+FreeBSD operating systems, or other operating systems derived from the
+source code to these operating systems, may be copied and redistribute=
d,
+provided that the binary files thereof are not modified in any way
+(except for unzipping of compressed files).
+
+2.1.3  Limitations.
+
+No Reverse Engineering.  Customer may not reverse engineer,
+decompile, or disassemble the SOFTWARE, nor attempt in any other
+manner to obtain the source code.
+
+No Separation of Components.  The SOFTWARE is licensed as a
+single product.  Its component parts may not be separated for use
+on more than one computer, nor otherwise used separately from the
+other parts.
+
+No Rental.  Customer may not rent or lease the SOFTWARE to someone
+else.
+
+3.  TERMINATION
+
+This LICENSE will automatically terminate if Customer fails to
+comply with any of the terms and conditions hereof.  In such event,
+Customer must destroy all copies of the SOFTWARE and all of its
+component parts.
+
+Defensive Suspension.  If Customer commences or participates in any le=
gal
+proceeding against NVIDIA, then NVIDIA may, in its sole discretion,
+suspend or terminate all license grants and any other rights provided
+under this LICENSE during the pendency of such legal proceedings.
+
+4.  COPYRIGHT
+
+All title and copyrights in and to the SOFTWARE (including but
+not limited to all images, photographs, animations, video, audio,
+music, text, and other information incorporated into the SOFTWARE),
+the accompanying printed materials, and any copies of the SOFTWARE,
+are owned by NVIDIA, or its suppliers.  The SOFTWARE is protected
+by copyright laws and international treaty provisions.  Accordingly,
+Customer is required to treat the SOFTWARE like any other copyrighted
+material, except as otherwise allowed pursuant to this LICENSE
+and that it may make one copy of the SOFTWARE solely for backup or
+archive purposes.
=20
 5.  APPLICABLE LAW
=20
 This agreement shall be deemed to have been made in, and shall be
-construed pursuant to, the laws of the State of Delaware.
-
-6.  NO WARRANTIES
-
-THE SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY EXPRESS OR IMPLIED
-WARRANTY OF ANY KIND, INCLUDING WARRANTIES OF MERCHANTABILITY,
-NONINFRINGEMENT, OR FITNESS FOR A PARTICULAR PURPOSE. NVIDIA does not
-warrant or assume responsibility for the accuracy or completeness of
-any information, text, graphics, links or other items contained within
-the SOFTWARE. NVIDIA does not represent that errors or other defects
-will be identified or corrected.
-
-7. LIMITATION OF LIABILITY
-
-IN NO EVENT SHALL NVIDIA, SUBSIDIARIES, LICENSORS, OR ITS SUPPLIERS BE
-LIABLE FOR ANY DAMAGES WHATSOEVER (INCLUDING, WITHOUT LIMITATION,
-DIRECT, INDIRECT, LOST PROFITS, CONSEQUENTIAL, BUSINESS INTERRUPTION
-OR LOST INFORMATION) ARISING OUT OF THE USE OF OR INABILITY TO USE THE
-SOFTWARE, EVEN IF NVIDIA HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
-DAMAGES. SOME JURISDICTIONS PROHIBIT EXCLUSION OR LIMITATION OF
-LIABILITY FOR IMPLIED WARRANTIES OR CONSEQUENTIAL OR INCIDENTAL
-DAMAGES, SO THE ABOVE LIMITATION MAY NOT APPLY TO YOU. YOU MAY ALSO
-HAVE OTHER LEGAL RIGHTS THAT VARY FROM JURISDICTION TO JURISDICTION.
-NOTWITHSTANDING THE FOREGOING, NVIDIA=E2=80=99S AGGREGATE LIABILITY AR=
ISING
-OUT OF THIS AGREEMENT SHALL NOT EXCEED ONE THOUSAND UNITED STATES
-DOLLARS (USD$1000).
-
-8.  MISCELLANEOUS
-
-The United Nations Convention on Contracts for the International Sale
-of Goods is specifically disclaimed.  If any provision of this LICENSE
-is inconsistent with, or cannot be fully enforced under, the law, such
-provision will be construed as limited to the extent necessary to be
-consistent with and fully enforceable under the law. This agreement is
-the final, complete and exclusive agreement between the parties
-relating to the subject matter hereof, and supersedes all prior or
-contemporaneous understandings and agreements relating to such subject
-matter, whether oral or written.    This LICENSE may only be modified
-in writing signed by an authorized officer of NVIDIA.  No failure or
-delay by NVIDIA in the exercise of any right, power or remedy under
-this LICENSE or under law shall operate as a waiver thereof. The
-parties acknowledge that the SOFTWARE is subject to U.S. export
-control laws and regulations.   The parties agree to comply with all
-applicable international and national laws that apply to the SOFTWARE,
-including the U.S. Export Administration Regulations, as well as
-end-user, end-use and destination restrictions issued by U.S. and
-other governments.  The SOFTWARE has been developed entirely at
-private expense and is commercial computer software provided with
-RESTRICTED RIGHTS. Use, dupli=C2=ACcation or disclosure of the SOFTWAR=
E by
-the U.S. Government or a U.S. Government subcontractor is subject to
-the restrictions set forth in the LICENSE under which the SOFTWARE was
-obtained pursuant to DFARS 227.7202-3(a) or as set forth in
-subparagraphs (c)(1) and (2) of the Commercial Computer SOFTWARE -
-Restricted Rights clause at FAR 52.227-19, as
-applicable. Contractor/manufacturer is NVIDIA, 2701 San Tomas
-Expressway, Santa Clara, CA 95050. Use of the SOFTWARE by the
-Government constitutes acknowledgment of NVIDIA's proprietary rights
-therein.
+construed pursuant to, the laws of the State of California.
+
+6.  DISCLAIMER OF WARRANTIES AND LIMITATION ON LIABILITY
+
+6.1  No Warranties.  TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE
+LAW, THE SOFTWARE IS PROVIDED "AS IS" AND NVIDIA AND ITS SUPPLIERS
+DISCLAIM ALL WARRANTIES, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT
+NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE.
+
+6.2  No Liability for Consequential Damages.  TO THE MAXIMUM
+EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL NVIDIA OR
+ITS SUPPLIERS BE LIABLE FOR ANY SPECIAL, INCIDENTAL, INDIRECT, OR
+CONSEQUENTIAL DAMAGES WHATSOEVER (INCLUDING, WITHOUT LIMITATION,
+DAMAGES FOR LOSS OF BUSINESS PROFITS, BUSINESS INTERRUPTION, LOSS
+OF BUSINESS INFORMATION, OR ANY OTHER PECUNIARY LOSS) ARISING OUT
+OF THE USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF NVIDIA HAS
+BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+7.  MISCELLANEOUS=20
+
+The United Nations Convention on Contracts for the International
+Sale of Goods is specifically disclaimed.  If any provision of this
+LICENSE is inconsistent with, or cannot be fully enforced under,
+the law, such provision will be construed as limited to the extent
+necessary to be consistent with and fully enforceable under the law.
+This agreement is the final, complete and exclusive agreement between
+the parties relating to the subject matter hereof, and supersedes
+all prior or contemporaneous understandings and agreements relating
+to such subject matter, whether oral or written.  Customer agrees
+that it will not ship, transfer or export the SOFTWARE into any
+country, or use the SOFTWARE in any manner, prohibited by the
+United States Bureau of Export Administration or any export laws,
+restrictions or regulations.  This LICENSE may only be modified in
+writing signed by an authorized officer of NVIDIA.
+
--=20
1.8.1.5
