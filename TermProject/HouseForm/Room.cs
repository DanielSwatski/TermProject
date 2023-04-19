using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TermProject.HouseForm
{
    public class Room
    {
        public Room()
        {
        }

        public string Address { get; set; }

        public string RoomType { get; set; }

        public int RoomSize { get; set; }

        public string Photo { get; set; }
    }
}